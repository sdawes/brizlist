import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <h1>brizlist.com</h1>
      <p>This site has been built using Next.js and deployed using AWS Amplify and domains with Route 53</p>
      <p>To come: dynamoDB and lambdas</p>
    </div>
  )
}
