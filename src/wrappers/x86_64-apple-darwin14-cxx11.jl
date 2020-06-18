# Autogenerated wrapper script for ArcadeLearningEnvironment_jll for x86_64-apple-darwin14-cxx11
export libale_c

using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libale_c`
const libale_c_splitpath = ["lib", "libale_c.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libale_c_path = ""

# libale_c-specific global declaration
# This will be filled out by __init__()
libale_c_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libale_c = "@rpath/libale_c.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"ArcadeLearningEnvironment")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list,))

    # Lastly, we need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libale_c_path = normpath(joinpath(artifact_dir, libale_c_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libale_c_handle = dlopen(libale_c_path)
    push!(LIBPATH_list, dirname(libale_c_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

