import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>brizlist.com</title>
        <link rel="icon" href="/favicon.io" />
      </Head>
      
      <main className={styles.main}>
        <h1 className={styles.title}>
          brizlist.com
        </h1>
        <p>This site has been built using Next.js and deployed using AWS Amplify and domains with Route 53</p>
        <p>To come: dynamoDB and lambdas</p>
      </main>
      
    </div>
  )
}
