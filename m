Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E09D355F49
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 01:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244123AbhDFXQG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 19:16:06 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55210 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbhDFXQG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 19:16:06 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 136NFK7i044680;
        Tue, 6 Apr 2021 23:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=2jSZiQXU4oFN4HDsvqloULCu18gu+MqkpbMHWAcH9yE=;
 b=p5ycExiJuBIZGi6JMbO6MDplok7EviAJmaO1LWR2cLEVsi4aapdTu+1zML+f7Sby8JtA
 OOGNRUvjj7nFNsvt3g5q7CdP4csqoV4lMQ/OGG91L/99hwepsm0bo5B8DJzsn+jiM3pm
 1QQhhkoMT0Z3GWScN7wcYFcR+4esMRimmkG5M8AF4GaKnioz/XVnD1510Y9InP/ld+Tw
 0NaGKtHVBuYfw4uOS7AaoH/bAsBP36IOb25GXOkAfmN4dHseEkVUkj8Fl5y1X7FCU63q
 M146C5bQ/+1n4lwAoRvAqPIbPRmwgiDm+1sIRHCTYghudUUjn+/7Z3NKer1j3XON2sz7 Vg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 37rvaw0rg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Apr 2021 23:15:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 136NBGIn104898;
        Tue, 6 Apr 2021 23:15:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by aserp3020.oracle.com with ESMTP id 37rvb317bm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Apr 2021 23:15:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=freKE3WJui0QoqY7DKF73Jsi++sqeUsKpwLGc5J3PcRLP/lEi5NpjE55RZaFlO23lWOTqR5hhapWv7mrmVptVFR/V9xJhRfjl1g9InnY+Pi1hYI66p59DU1KfSxcfdnh3LnV7gmrvhD6jlVOaQZavlQz4bz+kdquVFzhFWELd441JShamf64gUlYHu0jH2x2qLwL7JcAFx9NRffhqQUOBSvnsBcGas04tHtYUc0qN2X3JF0r3arRpUEt8jl3k+KV8Emqrc/5PRD4W5CIF6YGZT1SzN13NkYMFIfWO8GL9TBDRrO5pBqE1/jvWAY8O5iyvsDyEyDCaaCiRzL4FWhkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jSZiQXU4oFN4HDsvqloULCu18gu+MqkpbMHWAcH9yE=;
 b=Fhs/hgUiiheBgst7La1xhpDdARIoZE3XnTWEGO5DCD77NHlKnzyw1jOnXmMpQnoHG+1R8gtXUW+ov4Xv5UkE/IJdG8A3gL4O8Iuq513cdw9yLyKD3JKwPZMQD5K2iWp+H3u3RtpFMFKF4rYR3qZZjRmc2ow67m0jKGPsgI39GDKJ3EvEF3xuw5WBfpp2moSfi25u5HGs4uBIdt/LjXC/5W3lw/7EqDjuoH+hdJKeHJy8xP8Xo8q6N+1bSKTyz7PTEepqJg8F9S7rpX/WcZ+tvByWwDmc91Z/Zpv7fXSCvgofqGHctQtPyiyeWsJSHonayR9kQtBzrWBhbQNAHxuXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jSZiQXU4oFN4HDsvqloULCu18gu+MqkpbMHWAcH9yE=;
 b=wZP0oRsKUOd8Jq0yXylB3kgP07shRobH+bIeFX7PlG27mn/TMMj/shOhDPqYWZ47uCJa1HVXFIbESePp1tW8K8rr4yG6qVWwxJx5Nr7fxmnSYdPmTzLnWXckKliuvJMbdBai5lZB/P/b/hBy8cAK3G/IDD6uut/cRCRuqsy9Kf0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2536.namprd10.prod.outlook.com (2603:10b6:a02:b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 23:15:39 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 23:15:39 +0000
Subject: Re: linux-next: Fixes tag needs some work in the xen-tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Luca Fancellu <luca.fancellu@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210407073504.0758735d@canb.auug.org.au>
From:   Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <d1132773-e27d-a76d-5389-40a91921f401@oracle.com>
Date:   Tue, 6 Apr 2021 19:15:34 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <20210407073504.0758735d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.20]
X-ClientProxiedBy: SA9PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:21::22) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.103.20] (138.3.201.20) by SA9PR13CA0017.namprd13.prod.outlook.com (2603:10b6:806:21::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend Transport; Tue, 6 Apr 2021 23:15:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198304ac-b4e3-4362-b8f7-08d8f951e491
X-MS-TrafficTypeDiagnostic: BYAPR10MB2536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2536BC14E9D7D5B9D66FCBD38A769@BYAPR10MB2536.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQCduIuAJiTP4oICf8kly8se/t0hXyXlG4wWs6EwQZtmLzqWKGxT+HV4TxXbfzxQCB+lgVR5fWCig2/B7Wgz6RXhFOEfaOhmVOK2S8EOMX9kYUsu4dz1Bxo6uSceKZpGl/GFCUfy1SIyRP2I/HlC0O4UH73ybktGjFMF4V5zA76zRL7zbtMv76EcnFrFCohfespZb/tVrkvEvQw1yD7AAnyqB92Lrq2Z5X7N+CoYoT2HdGJELauAiiystp394d1TE6bZ9Mqz7cvrSL8bRsgzAJAHsC7V/Y1eHvxIxKQyHE/XaIFAtCjeUl+40ghjIjJirTeOgrZA8bY5XnNu+1iOltIr5eV2LnuBslB/7VIMwuikORRNRYXXiq7G+0XawT6wWGQhEfBeDp4SMHVPJ6IPaRJSOfJrUtwUzISjRDnWzPgwHKE63oixDSi8Nxvp1EDpaG3rTpAtCWYl7gN0gmOmh2j+Ziu/YlSxDpKoHIM6kWEfpFAo5OgPuuI4YAdxN3o1cc5iGxvG9sd9JuX/N8emfHj7Dt2LTLLcBfjo638QdWCmVWmiRD659qx54HlEF9Tyj+XVBv77JDSaSDJEVRkfdeGrolSCTPiMqnAxSwokFnMexs4Bog9ZpNjkh773dFBZc8K+RKT/vO4Z5L+muEABFGMkWnY9scNeAkt34Nv3fYihDjAR0XYDXuFS4Fts+suwTgHBVhJhYBuqM9afF8DFqXyMzH7GCW1pmrlGuR3deNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(366004)(39860400002)(16576012)(53546011)(8936002)(110136005)(4326008)(8676002)(66476007)(956004)(54906003)(2616005)(36756003)(5660300002)(66556008)(4744005)(16526019)(83380400001)(44832011)(316002)(38100700001)(6486002)(6666004)(478600001)(26005)(66946007)(31686004)(86362001)(31696002)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?imA3il9TbbeOUC2qMIRqPBvE/Ef0qacQwgZMqgzwyBL24hJFFlXxTM7D?=
 =?Windows-1252?Q?Pg1FwLEbisLx0VnaWB4SSbijeqdDyBL1kSHs8rRpJAqd1mz3rljOE770?=
 =?Windows-1252?Q?LGHQ3dWKbzXKl8VmVEhWCD+yzxHXkIh9/pSOiWYcAn220s9Ffrg3BpkZ?=
 =?Windows-1252?Q?K1fkvIUkrj6tN5lguk8xe+vOlIY5l8XsJY+KmdgRquKreRcM0JCTm0yz?=
 =?Windows-1252?Q?Jj7Wc2XWa0eJr5Fp2ulDM/HtjelAkxIOfFRY9xVD0fpw1YmPgLT5CivU?=
 =?Windows-1252?Q?TbMN7ArapdFcKv1HCshRjqTcyu6TYsPHjWitE9fTj9lOb7x4C72xMR1J?=
 =?Windows-1252?Q?sjINN5EsW3zisldp6Wve2PLLvmUyW6GftkVQxMzznWBwdHQFXxQ7IpP2?=
 =?Windows-1252?Q?Dv2OBmDjIpIPKsT0IJ4+5pN+/4X1xfFi+9s8/Lp/eynI96c8iv1p+Kzz?=
 =?Windows-1252?Q?Xr+vy7RTkF+9mOzRdjS/JpWVB4tcOJ54o5XJv1QqmnidqLwAZw3qFPvB?=
 =?Windows-1252?Q?qGBPKnt9L0OcTU8lE0jcjEFxquwLxWnZY1fquv7QVXXcNt30TCWzpk52?=
 =?Windows-1252?Q?XPTPxULcidUlvd9An1YyGotn10wXMadw10rmxTF9o9fsSP1ZU7JvH/w9?=
 =?Windows-1252?Q?fgzZqzEFXa3uTfOLByI89NQiivlRfW2USr0a8WTgIYt/4Ja9wCmW6xra?=
 =?Windows-1252?Q?yE1i5jCy9SmhNupCDPubjRnDGDNyfEj6mRa/Sa45E+IuxFi7Y231vdYC?=
 =?Windows-1252?Q?k66q2/UG/OZ75ju9DsHeNTRYOHUcEICpYXPRC7jiTIDmuHS4WGKxFVtI?=
 =?Windows-1252?Q?O9GrkUKBxu0L4iU302Jqpc/ui2ByWp0ZJ3ADS+n3P+6XUGtQL0FLgeeW?=
 =?Windows-1252?Q?B9XDt5ocYY/zSzxxnJztvA5nxRQC0BwPQOVfgpmfO8ns3LEZXG22hm9l?=
 =?Windows-1252?Q?hxtVrjhD7GwLQ8l8ghHafUHs1mzRz8zSYphOu4MwV+2ImymZHmgdxdni?=
 =?Windows-1252?Q?fJfuB4YZ6XZWH2rhHVOlcTLhtswAagDvH+bsvzH6bGPDbq7Zkn3Bwu31?=
 =?Windows-1252?Q?VD20ofcRpQlQXtb/L38ZNWx77EaoLI8Put8iX6Y+qS0nZDgxrnJK7oc/?=
 =?Windows-1252?Q?NAlZL6YMg1Niwj7B1EgD6Ow6fq+IdlupBFKOr5T+aW8DF0Ct781bOUC0?=
 =?Windows-1252?Q?FNIUlJbldVSN2Ueux8gVIXXgjZIZfsnBl0EmTLE05zV6owMXqKKctxsI?=
 =?Windows-1252?Q?qnZIfzXQLqL8QZAGCFS9NN6JllS6G0HvlaThB4CgPi6Q7dsRQLLQ0865?=
 =?Windows-1252?Q?E2WhxHn0qDbYBGxVOyEpnmiAvLSTPG08Y+wRz8wf8VARTPx2XmBzGUZc?=
 =?Windows-1252?Q?kq30zJGRD+9etvnXx/CgJYzbuSI8MjzmFVoWoW6kfzzg19rrIplKGHJ4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198304ac-b4e3-4362-b8f7-08d8f951e491
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 23:15:39.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D20wkaRnFuPyzLUtLzF3ms3V/uQEce064u5hHhjnma+LkB1JVOJTDITh+/HDCSQgsOTPAy8eR9eVfyrDABxHtQrJEEsJN3vEvpTvFQgBMhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2536
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9946 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104060158
X-Proofpoint-ORIG-GUID: T4Wwq0u_Yjo-Yxmor75fCP8vle1OYPCL
X-Proofpoint-GUID: T4Wwq0u_Yjo-Yxmor75fCP8vle1OYPCL
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9946 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104060158
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 4/6/21 5:35 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   da3b45cbcb0f ("xen/evtchn: Change irq_info lock to raw_spinlock_t")
>
> Fixes tag
>
>   Fixes: 25da4618af24 ("xen/events: don't unmask an event channel
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.  Also, please
> keep all the commit message tags together at the end of te commit message.



Thanks, fixed.



-boris

