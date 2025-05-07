import { FC } from "react";
interface IHeaderProps {};

export const Header: FC<IHeaderProps> = (props) => {
    return (
        <div>
           <h1 className="text-3xl">This is header !</h1> 
        </div>
    );
}
