module SpinaBlog
  class Blog
    attr_accessor :name, :namespace

    class << self

      # An array of all the SpinaBlog::Blog instances.
      def all
        ::SpinaBlog::BLOGS
      end

      # An array of all the defined blog namespaces used in URLs.
      def namespaces
        ::SpinaBlog::NAMESPACES
      end

      # Retrieves the blog by its name.
      def find_by_name(name)
        all.find { |blog| blog.name == name }
      end

      # Retrieves the blog by its namespace
      def find_by_namespace(namespace)
        all.find { |blog| blog.namespace == namespace }
      end

      # Registers a new blog on the site. This adds the blog to `all` and
      # the blog's namespace to `namespaces`.
      def register
        blog = new
        yield blog
        raise 'Missing blog name' if blog.name.nil?
        raise 'Missing blog namespace' if blog.namespace.nil?
        all << blog
        namespaces << blog.namespace
        blog
      end

    end
  end
end