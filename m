Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B5E445E11
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 03:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhKECxK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 22:53:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45966 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232025AbhKECxJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 22:53:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A52TiTm004844;
        Fri, 5 Nov 2021 02:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=z/Zk5tgXHASYIfQxXBF9mBTKutBPkRA7BmLUswIkG78=;
 b=ep6Ehb/iZQpEfIfCM+iuco7qSDGCdbf3dCrtAq2Z9BXnzI5NaUTb2KrzlA14mkYdIbbM
 iTp9YO4HeUZu1QbMGu3JZQPFzB/yrnAiq1edgpLgUayorBII9lgJtgJDkb/KzMzaS/XK
 guydV+S8QtY1+yd5Zf8vlHQXMwGv+EP+5A2JK9Vi4wRB69gLpjR55LJbTP8fxOIc5aA1
 xehxSjqrRR7muSe/l5KR4FaR+o+IEMuP8o/3Jh0usvN5U20NksjemKNkXJhcfI37oY1+
 8GI//0qmDER/SknUcLrnloCzBb70lnVnqrTgh1co7Um/EiN6O2pZVRggCDhwvaABeNXq 2g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7hrggt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Nov 2021 02:50:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A52jjfi130655;
        Fri, 5 Nov 2021 02:50:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by aserp3030.oracle.com with ESMTP id 3c4t5n4cxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Nov 2021 02:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTjuqRW+RQoGsb9ad5AbXtz3exylEatasjZgOqOqiqwIZpvsoIdnsx5dA2Duyz7N6RnlFJ/e+s9vnefe0gk7177E6V+9KV1W1dvIgwDBsCxvjnW8mGWeoao0tbI6XPdFDhUweg54fFrTvy+y3yIYWo092dWATKCHC2cSo2dOAksEUkIM62PA+pO/tzg0SSXBwBQ5w0foOH6Kstetvu5wIcqNadMqdxMESy+a9FAV46ZTy1gfZEhyhuwelBOa4B6ld8IuY6+gM+IOQAQCWknL6/GGZnWp5mmXopQDmCIaQH1XyTLvsTsVFTZJT/GtEXzSRDrLD+orR4bKqsx3JdsnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/Zk5tgXHASYIfQxXBF9mBTKutBPkRA7BmLUswIkG78=;
 b=kNBwWzW52j0LIM6iuQp2/koZqfdXiwmoo4PqBebqCYp3Gf1wdpvTGbtkUH0BdFjgCoaULK1vzDQ1XJcmRa3qMl6A0hIqa24IxW2mBQHEX4mpZT901mVi7tI870e7tuUjYJ5KNQSbB6s/iTK0zZzUVCzUmD5Zl9EnzJW1DrpaAGJR+ae1fctMSDMOHdEDnoZqfnVnFK42e9MIVR7xgwKnZrh+NjoKAMlpx5TMnuWmPRRPGXBtUKJAY2tpDJ07AVWY+Y5j67Ihbogzb7a18r69CEsMOiKV68v8l3F6yZmcofSlmSWR7dtN2L9K7tfarM0TGhuowlncDB8a9KSiuJSP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/Zk5tgXHASYIfQxXBF9mBTKutBPkRA7BmLUswIkG78=;
 b=HhjwBosCg7w8UIjyscZZIXoCs4b8ren6C3xbXSDna5MHY0Kkfm5bLXGm522vwh88/G92AS2rMi9PB3Dc4SgCoZXBvgt8yFISNH/SpgFQjodXLwwvgix4E8G1EcxyK0gqurYXZ5Lh92Rb5sHsSym/bUTxJskOnVcIeR9rIRQYUP0=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4405.namprd10.prod.outlook.com (2603:10b6:510:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 02:50:15 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::a457:48f2:991f:c349]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::a457:48f2:991f:c349%8]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 02:50:15 +0000
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1v917pbff.fsf@ca-mkp.ca.oracle.com>
References: <20211104153732.0cb0169a@canb.auug.org.au>
Date:   Thu, 04 Nov 2021 22:50:12 -0400
In-Reply-To: <20211104153732.0cb0169a@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 4 Nov 2021 15:37:32 +1100")
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0801CA0009.namprd08.prod.outlook.com
 (2603:10b6:803:29::19) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
Received: from ca-mkp.ca.oracle.com (138.3.201.40) by SN4PR0801CA0009.namprd08.prod.outlook.com (2603:10b6:803:29::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 02:50:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c67b1673-40ff-46c7-8ad3-08d9a006fee2
X-MS-TrafficTypeDiagnostic: PH0PR10MB4405:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4405A36AC79ADDCF73CE14918E8E9@PH0PR10MB4405.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: luUF0xTEbZ6pxwwj/a7SStqOE6Der5ozeGcciz84+0L9hNjnC23w09XQ8wrbaCQhOI0tpDKDKPifda4FjSV0Mxum9ipO+z5jH+iENNFdIUzJs953RBn5+phpod9XG6xafC5c9OOgFoNgJyuempj8QOeFgAo8vFQ2TCuFQSF4FG0XX4EbDRri67bE1zo1B07xeYINDrAu1exCyy7P8WrB8jXl9+v8az6kPW80h3KIE9mVUOWz/IPJ/f/RJtKYG3qi/Y61yVG05fDekQA+/QBzWlNhiur2cf64RYj4n1QXJqnuMDFRmGez6v+bsp5hX9K6atvQt6RxfS5zrP9a9benJjEaHKcAKHOS2Rbjn4V4c7DW+dH8oEGEeDSht5ldZX6yhEpBsE+yOeRIPKc8C9hrvF5VJJ8rUdwYVbn/43K1dlJt6oD5f3Z0xUUBuQIwkXMU56IwLV1vLKm3ukZ1bUH3tHnF4l4/WQJTpahBUjZrB0pUdAvp3lQ7DdqUWra3dh456Zl/Tf4KSnb5W3p9t1XOLeSttLRu3g1+qhP2Ic5+pWgp5AfrDPZdnlExyJTz2AQaeP4fEY7DYijwHhxYj1RnR8ca8uE9S587ADD2C9MR7h/TsTxPxA4vryiBeqUmEVS3wm/cNnnKfA8HnpDlJD4ge9G2djxr2PMwzOjIJ2akVOd67eSJSDGwyPW+F5dCfWxYe/+eYd3pNw9US2qsC/kfDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(38100700002)(66556008)(558084003)(66946007)(66476007)(316002)(54906003)(5660300002)(2906002)(36916002)(4326008)(508600001)(7696005)(52116002)(55016002)(26005)(8676002)(956004)(6666004)(86362001)(8936002)(186003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3xYMPwIBtKaVoQkGgZJvetY7SlcVMOodoErd8WKQO1wvbYX8JQZUq1DEyWO?=
 =?us-ascii?Q?/X246frnlx5arCuFuU2X7ARyk0fQ95i7TMoARHzuvN4H2cHKj00EeThARPtr?=
 =?us-ascii?Q?uqNRlcXf8n58LXimCa+EOUHnlvxi/W1klk6LSiufztRq8uU3QucLXn03ZXvq?=
 =?us-ascii?Q?eYzZ5AO6JeVEP8zaRzh6m+aSgdh1NWfAAVkU+0H2sodYhQlDDUDxlKzfDxVK?=
 =?us-ascii?Q?XCf2puIHVkrg3kYWUnWrJPdcoIjnODT3f/3Ut+fXyiwOoaChZGjZCtsuOAwx?=
 =?us-ascii?Q?6i+pWGUe2HA3KLmGieKNHYVF3wSsMPRSDPwdmJqtTHgOsQQ/w1o7w+/AzZUe?=
 =?us-ascii?Q?SOAw0FtNINJwzR7kpw6i3DHY9izJIBfGJUqSf5Q3bf+c+2I5LLwb2Xvx1c+D?=
 =?us-ascii?Q?x3uJ0JoVOz/zVY+tMCWr9k1ju8ZZUPTn6SCUPKimMC+WFKyyyeBA5y1PeENt?=
 =?us-ascii?Q?oZr+I1ojGgqXamqVptrWjO07kQROYZ6hwtDSr/S1vlFW3FKvIy4JM7Ig6uIC?=
 =?us-ascii?Q?grR2AXlqCIoiWW3cJRgEL9IzqRIpytRBCXqLb39QEjK6ZZK+nR0IhDyN52oE?=
 =?us-ascii?Q?Qp85ttoKTH0H2PQq5GNmVc1GX1gVJTaRYN4cJllRiRoPN3sEl8Y4HBDTYPh0?=
 =?us-ascii?Q?aNsnfXSXwQK0HVDZro8LvnVFh/gECu1elzryxAjUwZ6XGAVQnNb58NgDcELx?=
 =?us-ascii?Q?7MqCIpQhA3IiU4WEpMvXRsem8KDS/8joRmr9m+qcuv0wMgcs4oqkSGF3Cpvz?=
 =?us-ascii?Q?YTSMTVWd8d7m+6u+B6D1/425VM9jSmKgDVYt3Faw8BkpSlxKlH8wt9pfa87i?=
 =?us-ascii?Q?gZVqq670HvsisHfTBybrsrcE7icfsrA04ElBNllE3C2P01B1yvnvskQbdz3D?=
 =?us-ascii?Q?T04m77XJgWIcyWbWZRwHcU5aq5vZw2CoDimZBEpPqYNOtDT6nF/oX94E/+No?=
 =?us-ascii?Q?FkYA+D7cANaWyOI/PjqUQS0YAgzIRglnR0C8Dba9HSadHvx/s0aC4KMVxwOB?=
 =?us-ascii?Q?/lh8DqBr24owlN8LTf7n+apmOHCcffO3H9RfuFt7A2jqA2nXAVrmDHOLxmLZ?=
 =?us-ascii?Q?dyBBPP9TImJMo4R4g0KNq92yXn5+9bgaTONyFw/bfvLrRQPHsEzKHSbUYeel?=
 =?us-ascii?Q?DJUdbbM3NruTzgyz0xV6oNgXT9cLtRKtSJwGwkLlS7UEwYypnUoxxHAUBPXG?=
 =?us-ascii?Q?BdiX287cIbebH7l7uZj4DJ8Kep7ywa5j4A3QeK0n+l6eBfYwhtEiv9kc6zdy?=
 =?us-ascii?Q?P/3wCD5YBhDLLn7gwjydgwKxd6OcKcZNKzWTR7+6G8bylMrGk3FSwkqgryUD?=
 =?us-ascii?Q?V1wHgnrVGw4xiK58IqH7DNCSEmhe50oYLCHaWJI2nt8OVXNKHgLrNAJaC6w3?=
 =?us-ascii?Q?Obi+ZzOztrHOkm92NOYQBaFTKvWMiZnKKAgDviPcGET6uCkj3uRK1DLssmrS?=
 =?us-ascii?Q?0SVMRcPCzFES42djnV8rjxTVfBxLivVOBvYk39xJSo56CLrpI4nq+D0VXEvD?=
 =?us-ascii?Q?jAfktqACpu5BmLUV6uL7nFtpPFSng0jKU4N94jeqZjHjMu21FyiUc4Uo/M68?=
 =?us-ascii?Q?5H+D9eYO5RwtMj1TKqfjP2Cvb9osFou6efUB19PX2Kb1SIC1du11Ev2gcunJ?=
 =?us-ascii?Q?2FZY2pUINGqlU0lrPWaCJ7RRx+eY7Z/DtAsQlVU3RH9mOFQmJv0U9OKz2IRK?=
 =?us-ascii?Q?e0GZgA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67b1673-40ff-46c7-8ad3-08d9a006fee2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 02:50:15.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrbx5H18PbEGGRL7rM8yw0eTeKakTcb8QMoiAwUhdO0v4B9z/uus7Z4Dy5qo79lhA6pgnrdvvgdBXhYki8Yo200Ry6p0Hkmw/ClmlJzEPRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4405
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050014
X-Proofpoint-GUID: 0RlO5G6xJgXEJaIXhmRkjvpC6jAZ6bt7
X-Proofpoint-ORIG-GUID: 0RlO5G6xJgXEJaIXhmRkjvpC6jAZ6bt7
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>   Fixes: 2ceda20f0a99a74a82b78870f3b3e5fa93087a7f

Interesting. A recent subtle tweak to my commit hook's regex resulted in
it no longer matching when the subject was missing. Sorry about that!
Fixed it up.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
