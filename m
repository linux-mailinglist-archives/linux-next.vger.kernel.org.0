Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366F11B1AD5
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 02:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDUAmG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 20:42:06 -0400
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:59870 "EHLO
        m9a0014g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726469AbgDUAmF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 20:42:05 -0400
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY m9a0014g.houston.softwaregrp.com WITH ESMTP;
 Tue, 21 Apr 2020 00:41:17 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 21 Apr 2020 00:40:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 21 Apr 2020 00:40:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4TmeUOIV/j7ZuuhLwH6NWg6ktIm3lqYwWK/KY5OwkilBVO0Emw6FMqIu9+LexfkZi5JMkwWzGIPiNRqdCOwiakIVsPrZg2JzcHjSweuhosxEgvaCE8Z81/qChsvMe9BuyaU4pJoUb2qSpooxQvd6UYBl16CuCLf/pb/0HW7lSH8mVw3YwfU2IFs3YQUbaXA9hnynyVS8NbtTgkVLvmxD5zW5p4rAW4FaGUoyi1Sa5xn7RVjcmnGypo6Z+wPvU+szlDJUWD0NFKc7N+MHOfOmdruMNc2PQqBm0xfDhpoXVo7Z4zPrOn9JMuNl63AV5XrsRw6FXkHOfaypKpV3Bnl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QStx44helXh10pPPQKTFr8HcrSHBDxQ7dZtlGyIilGQ=;
 b=ck5xQ5V0sPulqth88ZVvD9/iRvR0VgZCcdH2Rs++Ot8qddBuYpLI4BIvfQ7Dc7PU++TWlR+zXILo8v5gmmsi2ugcD21dQ52CWjv8TsQKgXfXVCGNBCY2qAwxPqCSrTL196BmAUqVN5K2zTqdqnrLMDESH3GBqQ8g7vWxTmJymaUZYjGWeliQcPgsWbR4eeeYUI8jTAgh/xzyZWOd+8W9s/uYDpl2bDqqIbVEzOMZo1XTWEUIjNft/g9dCzChAm+JvzjS4R91aI4vmy5VX1ik2NhJVsq5qfdMwajNZBL2ySEYNneWmup947pJo+W/W4rv+p2LAFo5YRJsvZ1j53BuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
Received: from MN2PR18MB2416.namprd18.prod.outlook.com (2603:10b6:208:a9::25)
 by MN2PR18MB3261.namprd18.prod.outlook.com (2603:10b6:208:16c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 00:40:51 +0000
Received: from MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6]) by MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6%4]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 00:40:51 +0000
Subject: Re: linux-next: build failure after merge of the btrfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.cz>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200421102520.53623f09@canb.auug.org.au>
From:   Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0GFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPokBTQQTAQgAOAIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJdnDWhAAoJEMI9kfOhJf6oZgoH
 90uqoGyUh5UWtiT9zjUcvlMTCpd/QSgwagDuY+tEdVPaKlcnTNAvZKWSit8VuocjrOFbTLwb
 vZ43n5f/l/1QtwMgQei/RMY2XhW+totimzlHVuxVaIDwkF+zc+pUI6lDPnULZHS3mWhbVr9N
 vZAAYVV7GesyyFpZiNm7GLvLmtEdYbc9OnIAOZb3eKfY3mWEs0eU0MxikcZSOYy3EWY3JES7
 J9pFgBrCn4hF83tPH2sphh1GUFii+AUGBMY/dC6VgMKbCugg+u/dTZEcBXxD17m+UcbucB/k
 F2oxqZBEQrb5SogdIq7Y9dZdlf1m3GRRJTX7eWefZw10HhFhs1mwx7kBDQRZ1YGvAQgAqlPr
 YeBLMv3PAZ75YhQIwH6c4SNcB++hQ9TCT5gIQNw51+SQzkXIGgmzxMIS49cZcE4KXk/kHw5h
 ieQeQZa60BWVRNXwoRI4ib8okgDuMkD5Kz1WEyO149+BZ7HD4/yK0VFJGuvDJR8T7RZwB69u
 VSLjkuNZZmCmDcDzS0c/SJOg5nkxt1iTtgUETb1wNKV6yR9XzRkrEW/qShChyrS9fNN8e9c0
 MQsC4fsyz9Ylx1TOY/IF/c6rqYoEEfwnpdlz0uOM1nA1vK+wdKtXluCa79MdfaeD/dt76Kp/
 o6CAKLLcjU1Iwnkq1HSrYfY3HZWpvV9g84gPwxwxX0uXquHxLwARAQABiQE8BBgBCAAmAhsM
 FiEELd9y5aWlW6idqkLhwj2R86El/qgFAl2cNa4FCQlqTn8ACgkQwj2R86El/qhXBAf/eXLP
 HDNTkHRPxoDnwhscIHJDHlsszke25AFltJQ1adoaYCbsQVv4Mn5rQZ1Gon54IMdxBN3r/B08
 rGVPatIfkycMCShr+rFHPKnExhQ7Wr555fq+sQ1GOwOhr1xLEqAhBMp28u9m8hnkqL36v+AF
 hjTwRtS+tRMZfoG6n72xAj984l56G9NPfs/SOKl6HR0mCDXwJGZAOdtyRmqddi53SXi5N4H1
 jWX1xFshp7nIkRm6hEpISEWr/KKLbAiKKbP0ql5tP5PinJeIBlDv4g/0+aGoGg4dELTnfEVk
 jMC8cJ/LiIaR/OEOF9S2nSeTQoBmusTz+aqkbogvvYGam6uDYw==
Message-ID: <9aee72df-9140-c86b-cf37-568a546d8b76@suse.com>
Date:   Tue, 21 Apr 2020 08:40:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200421102520.53623f09@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="69TaVwZKQDiHnowhXLtVZFlJeZuXaZXYQ"
X-ClientProxiedBy: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To MN2PR18MB2416.namprd18.prod.outlook.com
 (2603:10b6:208:a9::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by BY5PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:180::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.6 via Frontend Transport; Tue, 21 Apr 2020 00:40:49 +0000
X-Originating-IP: [149.28.201.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c15a7f2-504d-40f4-7b61-08d7e58ca43d
X-MS-TrafficTypeDiagnostic: MN2PR18MB3261:
X-Microsoft-Antispam-PRVS: <MN2PR18MB3261071C7612295DCF599FA4D6D50@MN2PR18MB3261.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2416.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(66556008)(478600001)(66476007)(66946007)(956004)(81156014)(8676002)(8936002)(53546011)(36756003)(31696002)(86362001)(21480400003)(6666004)(2616005)(316002)(26005)(16576012)(5660300002)(54906003)(186003)(16526019)(110136005)(4326008)(6706004)(31686004)(33964004)(52116002)(6486002)(2906002)(235185007)(78286006);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEOShgNEyYez0A5znvzVqF1X1uKrFGfPJbhuazjK10pgNCcpmLBhT9WehkWsB4gYRtWIAxAlhTH13zlTHXuUcEizzHomvRfzwXzF1GIxsa7MX6DSOABLcOBYBS5/2KilxHWF5rSeA94e3OLJUWnkYg/1yFjGRe/WvmJMCcCaN34iV7aF4r3mhBvlSC7ts7C2ENoHZpO2d9F23mCoqOJU+OSM899NJRouJCq/axLLkspUf6VfaksN5A3L/K+PeSNNBK2FuUzWvvlwn5vmHf1glSVfWAhYj/7lFMS2eO2Zl07Mp+DwOn/5cem8kPt9EU2szjBd2EKT9TNDpPpgdYji2VpcMfpxFh0bbXwEGRGYxRNiRm6XxWNLxSGOlyKqM/7GGeJRnSSMZO5fEZn+qR1KrQBbuVRPkQTlzPdL9FSgYmf6T1KBdf+7XW8W6o9gLu0Rm+dtIi0D/6hsUkJ7cdP5DLKlKFnh1dz6EvDP38SjCkVain/t0zFMd9oOr3an6T8mwtm2c3Ef21QLxSZV+dkNpiXXl2gs5yIVHGTPiOG2Qgw=
X-MS-Exchange-AntiSpam-MessageData: 4gisiagXCU01hZGiKKLfF2R4419fQj1brfvDA5zdvG5hAfzPyXjpdoMAfZlBxFo5i+ZTb98Q4FDXK6b72yfM9pVMewrvizlZEvF0iupfnbJ9QHr4i48BclPUGHT2SOJKgoRpgILX80oFujrMzI5evw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c15a7f2-504d-40f4-7b61-08d7e58ca43d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 00:40:51.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeTAJDY+3YjAQ+4sFVsIj2g1Vm9oMN9dRnTTEtxWRsnwNgq2+eW/2QRb0bC522Od
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3261
X-OriginatorOrg: suse.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--69TaVwZKQDiHnowhXLtVZFlJeZuXaZXYQ
Content-Type: multipart/mixed; boundary="rSoETWoZ3oi0cb8DrKlpj4Q5noPQABOe6"

--rSoETWoZ3oi0cb8DrKlpj4Q5noPQABOe6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2020/4/21 =E4=B8=8A=E5=8D=888:25, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from <command-line>:32:

Any extra info?

It builds fine in my environment, with older HEAD though.

Is there any new commits which changed <linux/types.h> header?
As it should includes u8 typedef.

Thanks,
Qu

> ./usr/include/linux/btrfs_tree.h:1127:2: error: unknown type name 'u8'
>  1127 |  u8 tree_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1128:2: error: unknown type name 'u8'
>  1128 |  u8 chunk_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1129:2: error: unknown type name 'u8'
>  1129 |  u8 extent_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1130:2: error: unknown type name 'u8'
>  1130 |  u8 fs_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1131:2: error: unknown type name 'u8'
>  1131 |  u8 dev_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1132:2: error: unknown type name 'u8'
>  1132 |  u8 csum_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1134:2: error: unknown type name 'u8'
>  1134 |  u8 unused_8[10];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1148:2: error: unknown type name 'u8'
>  1148 |  u8 csum[BTRFS_CSUM_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1150:2: error: unknown type name 'u8'
>  1150 |  u8 fsid[BTRFS_FSID_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1177:2: error: unknown type name 'u8'
>  1177 |  u8 root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1178:2: error: unknown type name 'u8'
>  1178 |  u8 chunk_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1179:2: error: unknown type name 'u8'
>  1179 |  u8 log_root_level;
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1188:2: error: unknown type name 'u8'
>  1188 |  u8 metadata_uuid[BTRFS_FSID_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1192:2: error: unknown type name 'u8'
>  1192 |  u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1283:2: error: unknown type name 'u8'
>  1283 |  u8 csum[BTRFS_CSUM_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1284:2: error: unknown type name 'u8'
>  1284 |  u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1289:2: error: unknown type name 'u8'
>  1289 |  u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
>       |  ^~
> ./usr/include/linux/btrfs_tree.h:1293:2: error: unknown type name 'u8'
>  1293 |  u8 level;
>       |  ^~
>=20
> Caused by commit
>=20
>   8d80a063d508 ("btrfs: move on-disk structure definitions to btrfs_tre=
e.h")
>=20
> They should probably all be __u8 ...
>=20
> I have applied the following patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Apr 2020 10:19:20 +1000
> Subject: [PATCH] btrfs: uapi headers should use __<type>
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/uapi/linux/btrfs_tree.h | 36 ++++++++++++++++-----------------=

>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/include/uapi/linux/btrfs_tree.h b/include/uapi/linux/btrfs=
_tree.h
> index a02318e4d2a9..1adf5971a966 100644
> --- a/include/uapi/linux/btrfs_tree.h
> +++ b/include/uapi/linux/btrfs_tree.h
> @@ -1124,14 +1124,14 @@ struct btrfs_root_backup {
>  	/* future */
>  	__le64 unused_64[4];
> =20
> -	u8 tree_root_level;
> -	u8 chunk_root_level;
> -	u8 extent_root_level;
> -	u8 fs_root_level;
> -	u8 dev_root_level;
> -	u8 csum_root_level;
> +	__u8 tree_root_level;
> +	__u8 chunk_root_level;
> +	__u8 extent_root_level;
> +	__u8 fs_root_level;
> +	__u8 dev_root_level;
> +	__u8 csum_root_level;
>  	/* future and to align */
> -	u8 unused_8[10];
> +	__u8 unused_8[10];
>  } __attribute__ ((__packed__));
> =20
>  /*
> @@ -1145,9 +1145,9 @@ struct btrfs_root_backup {
>  /* The super block basically lists the main trees of the FS. */
>  struct btrfs_super_block {
>  	/* The first 4 fields must match struct btrfs_header */
> -	u8 csum[BTRFS_CSUM_SIZE];
> +	__u8 csum[BTRFS_CSUM_SIZE];
>  	/* FS specific UUID, visible to user */
> -	u8 fsid[BTRFS_FSID_SIZE];
> +	__u8 fsid[BTRFS_FSID_SIZE];
>  	__le64 bytenr; /* this block number */
>  	__le64 flags;
> =20
> @@ -1174,9 +1174,9 @@ struct btrfs_super_block {
>  	__le64 compat_ro_flags;
>  	__le64 incompat_flags;
>  	__le16 csum_type;
> -	u8 root_level;
> -	u8 chunk_root_level;
> -	u8 log_root_level;
> +	__u8 root_level;
> +	__u8 chunk_root_level;
> +	__u8 log_root_level;
>  	struct btrfs_dev_item dev_item;
> =20
>  	char label[BTRFS_LABEL_SIZE];
> @@ -1185,11 +1185,11 @@ struct btrfs_super_block {
>  	__le64 uuid_tree_generation;
> =20
>  	/* The UUID written into btree blocks */
> -	u8 metadata_uuid[BTRFS_FSID_SIZE];
> +	__u8 metadata_uuid[BTRFS_FSID_SIZE];
> =20
>  	/* Future expansion */
>  	__le64 reserved[28];
> -	u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
> +	__u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
>  	struct btrfs_root_backup super_roots[BTRFS_NUM_BACKUP_ROOTS];
>  } __attribute__ ((__packed__));
> =20
> @@ -1280,17 +1280,17 @@ struct btrfs_super_block {
>  /* Every tree block (leaf or node) starts with this header. */
>  struct btrfs_header {
>  	/* These first four must match the super block */
> -	u8 csum[BTRFS_CSUM_SIZE];
> -	u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
> +	__u8 csum[BTRFS_CSUM_SIZE];
> +	__u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
>  	__le64 bytenr; /* Which block this node is supposed to live in */
>  	__le64 flags;
> =20
>  	/* Allowed to be different from the super from here on down. */
> -	u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
> +	__u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
>  	__le64 generation;
>  	__le64 owner;
>  	__le32 nritems;
> -	u8 level;
> +	__u8 level;
>  } __attribute__ ((__packed__));
> =20
>  /*
>=20


--rSoETWoZ3oi0cb8DrKlpj4Q5noPQABOe6--

--69TaVwZKQDiHnowhXLtVZFlJeZuXaZXYQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl6eQQ0ACgkQwj2R86El
/qhwzAf/Say8LKR2ceSkQzuCu0e9ME71tW106dFjvsbUW+wx1iYvFLmDfCMpM1oE
TndC12XD4pj7h6UmH4tKZJ8hNkCSg7PH3WBn0+Xsq8wFoMZ866daurjcPdFONJno
GHJKnc1DthSpnsKwTVcVcN0b3KP0wVMDp1FWv8lbMnoK5P2wH3R6wQ51Dn6g0JUg
v9kX5aBTD7DSrsqAALHLlnvsuLbKGyjQ/U2Hb1MMqJyCj49PdDaz9QSmMzHEv3mg
REoBAOUJHOXEHshzE9TMPRNlmM6/uGlSpK2BMReXWDoyd8Z8oChQi6UEr29UID6j
23k1cRzZ8kflMn4nV+icdIBvb/aUpw==
=cnFx
-----END PGP SIGNATURE-----

--69TaVwZKQDiHnowhXLtVZFlJeZuXaZXYQ--
