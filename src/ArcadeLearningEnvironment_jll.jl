# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule ArcadeLearningEnvironment_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("ArcadeLearningEnvironment")
JLLWrappers.@generate_main_file("ArcadeLearningEnvironment", UUID("52cbb755-00ff-5a24-b23e-8a91c598877e"))
end  # module ArcadeLearningEnvironment_jll
