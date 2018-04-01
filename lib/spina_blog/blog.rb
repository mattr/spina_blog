module SpinaBlog
  class Blog
    attr_accessor :name, :namespace

    class << self

      def all
        ::SpinaBlog::BLOGS
      end

      def find_by_name(name)
        all.find { |blog| blog.name == name }
      end

      def register
        blog = new
        yield blog
        raise 'Missing blog name' if blog.name.nil?
        raise 'Missing blog namespace' if blog.namespace.nil?
        all << blog
        blog
      end

    end
  end
end