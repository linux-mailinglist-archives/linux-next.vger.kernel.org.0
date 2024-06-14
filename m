Return-Path: <linux-next+bounces-2556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4C908BB1
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 14:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916D41C20A30
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 12:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EDB192B87;
	Fri, 14 Jun 2024 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mSiDMrvw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tlXnmwPn"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181512D74D;
	Fri, 14 Jun 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368282; cv=fail; b=TvS0J+OAhYd6fcS/JfW7AtVqFeRxyKf+Xpk1EpukxHr646/x6BznDQxoAWRlK+3wNau1whAnIhN00F7sya6WG0IjB2UHIH4ASdPdHOq2ddqVQ1tWXIlBjAW83nwRHxhJ+E/anWt0lItH/bNlRlOH7QZT0vzbKm4R8s6ygsfdYrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368282; c=relaxed/simple;
	bh=BmmSYQtT4TC2EJUw/CgPrJ/hAonKAjMSr11IdBfJfWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R+Uueaf97wQFaRxWUhe3f3tD2uVO5kAtQSP4T+oWdJx/CdwD+c5rWUoIR68b7lXuaZ+XhtRiMEpCWU3j+DnPsjwjYCoQxLxVbwH1rLQ119/FEMkXua5uYtLDXFrR0BxHPscFU8ZCzc/F4SZmRQF5SnRXqTfWX0meE9vJUJftLxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mSiDMrvw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tlXnmwPn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fxbN010017;
	Fri, 14 Jun 2024 12:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=T5JAe4OxPwHOYiZ
	7+8SgOfdWPgm014Ex+zNnSngLgzA=; b=mSiDMrvwux3Lhoj2cjBQEv5UOu0NDA5
	GET0dM6z4PcSg8+T3G6G1gwhvlOswNWCEMLlGhXM6P0mrS0kU9ik0zKMSXEbJqip
	k80gydWnbn8kNvlEWugU8x+dsxfBmh3/CST7Cklf5igOUvw2R5UmjjGOf52mC36K
	SY8XA1hltxZZ+zMi7K3OUJsKV5aZsEVnrH4FmYmKB0t+0qPhKafyg0jDDwwA7sZh
	TpMg7R+kXSsFyzId76xpXWT9s3ubiHwpot9gwAcHhl1EyxNi5jmgSefeOgndCQhO
	LfYHb32Fmx/GLaA9Ibxx5S5HYEjLEmOorbTYqI0kZ6jsULpuMTfvGtg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh19bhpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 12:31:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EC74T4020368;
	Fri, 14 Jun 2024 12:31:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync92hne5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 12:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS0dt8zJ5G/SdG0UdwEpLhuBiXWtQkjOyB3MR0AOLQtdquR51czmzJOYrkcMNTj/1zIv8Vo5QL0OsjgWbNnedk7ybwws6g4E08DZD7TE4+Dv7UTKYPddSNh+Xotx5v6IkMtd4psuEaCid076xTKEJmWY0sOcLa9Ed7w0Lu0bw9DtlYzGjU9sN+W1jKQhTideJArNgMigbQLye7G1iSflHROHyZzZE725N1h+u8s0Ep46RBijHLFRlYbBoypqDztEKDKgHIO7FrILb/UvHrZQafzxmA1doK0J5zRTj8AuLGbA3+Yz53svQMbEzhxQha4FBIO0R8idLRXpm1EIs7UnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5JAe4OxPwHOYiZ7+8SgOfdWPgm014Ex+zNnSngLgzA=;
 b=ftw1QwCYEkpEv450Tb4RTaiZuin2mtFDIWtXmC9TnaE6i8y1p1eyCO6JwxdEh1CCQRhnkQgV7/uFVkUyUvOHexLy5Qx5YdZEGUl7yseNq22hz9rMUmorWyxLeE1FU9zHqpf9/rYcJw2Osx4m+MR+GXQnbh7SoGEJqoGJWwfIt4qgM6lq/H8lh+mKF2geIK62t+L190J9Fk0+xI4ISLLLAutD282o6DA9NnsZAykndPq59KXqpQQUNtNHMl6TqCbyG3kd4thHdbmdp7Us+nzw7EM8dA1cedKzCS8oJweBVWf9hK+dL8ppYn25GVkEzbavjL0Wb2/JZ90re1TtIXEfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5JAe4OxPwHOYiZ7+8SgOfdWPgm014Ex+zNnSngLgzA=;
 b=tlXnmwPn6/NQT+TITsjh7cmGGgArA5jIwQtA+W61XoaSBpGsVRQgVLe47bCOBw+3k5QrDbIqGfeqhM8XzNFRMkhrC5xoh/xEoG5yxCxRBYB0+/5+GLvjzZ7qzD4Gq+knsiu61Wvav41ettpRNZDs/WK+fGROQTVEL/O9sXpjL8g=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by BLAPR10MB5044.namprd10.prod.outlook.com (2603:10b6:208:326::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 12:31:11 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 12:31:11 +0000
Date: Fri, 14 Jun 2024 08:31:08 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-ID: <xtp3sep2enh3navci7hrfgobnoki5iqffwdusqmusmqfyxvmbl@x6rkw4qlc2em>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Bert Karwatzki <spasswolf@web.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-next@vger.kernel.org
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
 <Zmv3O8W-OqUqkPwS@krava>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmv3O8W-OqUqkPwS@krava>
User-Agent: NeoMutt/20231103
X-ClientProxiedBy: YT4P288CA0046.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::28) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|BLAPR10MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e93e7-f133-4433-09f3-08dc8c6ddf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nXI0llaW/6J2fFpWGholutASKqUOjcxdW3qKAHMSGNxbMma/BN62NpCukSx5?=
 =?us-ascii?Q?vLZkFZqY53wEt3VqbpX3cdl5ZlTc/GZbxrCz+ES0+hM3Ou6jJoYz4c6lXVRL?=
 =?us-ascii?Q?6qQNUU3JJPSROEVIgIJsnt/KOx92HTWObT+k43jf+PZPPRjRtbvUgbIfaXkQ?=
 =?us-ascii?Q?IjqM27WCWtbZyjBNCs6ANyfdTTvhyPaJU3gmKRPDpmMDmVmawAln3dkutC+O?=
 =?us-ascii?Q?IxcpwBW5sb/W5DPVmDL48CYKAKoENCsOMeHgrjSfgIjf49D2UzJ5lM9FsW2g?=
 =?us-ascii?Q?AJrIMDST3TYIaIh8iKVz8nAzqjqDBblZIqNN1ozDxHUuBxmOWEOgwZZDzNaG?=
 =?us-ascii?Q?dDlD5nmVZ0MgiXyoUmteHINeU+WKapBdYPj1CZimIGAhimjujlSNKQB6wqlk?=
 =?us-ascii?Q?21q5mPJ4BnjEkxJ57P1+5M1xzVlvY0uOSP7msdrOdP/rLnHNSL1Q2bs5de8Z?=
 =?us-ascii?Q?feHJIIQoPK/4pDT7opxag/6R6WdldhMnryKVTMeo1qNQ/pBM5wf+UL3zM+VO?=
 =?us-ascii?Q?MInYGUE5bcUnwARnUmq+cI/SfpJqYYJF3MEqiEZ8VKN2jNwdfMvOVadash7B?=
 =?us-ascii?Q?YS8PH5UN8EFzoqobuFxGl1Ozd8FNauxj5qGzS8u2TJNkxAfVdDT5ZGyGXOvg?=
 =?us-ascii?Q?5PDYeEWnINkpIjJ2C0k2CY1X21O49fSLGA1Kkv0doBylEMvxfA9fUvLjjgLR?=
 =?us-ascii?Q?J1/i5htuo80PjlEzQ+20QQYtezm5VeyNAkmDcyV3Bfo5P92AXwBrEQmk2NfD?=
 =?us-ascii?Q?bGICjuJ/CCF/FpbCtbhET6IRSfHM3bLK5OtOJTPZpM6G1OOM9Mo/ZyBQAzHv?=
 =?us-ascii?Q?EZt8fcI4COrv1U6lYj7W6vGsAkYBUyMnuaqaZpydWCkvd4q9M/KRcVc06yMK?=
 =?us-ascii?Q?Ah9ktCiwibxbsbN/GytKunhh2RNUfh8SLhyIopnOIG/x8CjrfG/8mjZR6JwD?=
 =?us-ascii?Q?G3eKOc4EWhHjQLxkf62w7OHz3ViEEyvDhshYZvXuk6u4ZpzR7H3OeKnSa5gW?=
 =?us-ascii?Q?GR7oPefJn6sPdY5UAo3W6pRkHVCWlxDDV3EkubhCKshLoiwhQBwChFhwbIt0?=
 =?us-ascii?Q?eZO26PhZGalQ2gZ6/I5XDCXKrVOLZkoeNZZa637rx9MeoKKonNpnMhn19WY7?=
 =?us-ascii?Q?VYaoq+AtxmYzRq3LySf2UPYuQS9mcebJrKOPBL7hipucZ09DaS16u2IisJQc?=
 =?us-ascii?Q?MUTxKHgh9hplBeNGSRpy16CvZWGBcrYfiRnL6mZ67bFRLtOf1j9ByARq6IV5?=
 =?us-ascii?Q?dLWmZ/R+Nl9TIvJefGnswar6TWDZdWSwgh5U/l5rzQEEZU/LeHqaXa+B5OzH?=
 =?us-ascii?Q?YZo1iwgXJ4GSXTawpZw3k6ks?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eo/H0LZY0bNIlL9QfFYlVEGgCNPNZnEPc2wnD+qUNOiuxZHtaGZmKiR2rfOe?=
 =?us-ascii?Q?RxkvD6rvvNU94/azfEj/TUtigVwUNcP2NKObblVMKOm4uP2K4e2uWMEmxTc3?=
 =?us-ascii?Q?omOfBdhw3/r/oaaVwdN3gO+QLuVh+GZ6yXesOqkPPiZbyeVI6sleHBFg4um/?=
 =?us-ascii?Q?pVp1ZNiBvJheL/M9u8RNkPnq+4vPkJbXrDQvkJcpa3Yw22vYClD2V9zNVKCk?=
 =?us-ascii?Q?QR9QYYez0nyR4C7spURu7BLALlLtaLtO4xp2tQXkRS37KiPH3VYyUSuWfwNM?=
 =?us-ascii?Q?85k9KAW6P7SIuG5VYrQm2S+Se44brDTO1LIrPa1R2MnwrJDm9rz/UgIVdckx?=
 =?us-ascii?Q?d21SEYdRgh7AgB67E5T4BFxAu+fRjXc1VFgSKqCFrSxIcg87nz8K/9lPiD6K?=
 =?us-ascii?Q?tgQxe/cSvUxGxrIl8XAYqzgrel3cl3lb/wciKalKp1jKoQQsIQqKf40f/pbZ?=
 =?us-ascii?Q?eLbPgKV07Fw4U5syeZm2OzoybDB58K67YDPdQpQ6lZw0uD6GOwbgTocBEa2r?=
 =?us-ascii?Q?iOLR+auKc7d5LagbwjU1+gtmrbQkVMumHy+PatB/V/fBil5ACoCqBzcF3BVx?=
 =?us-ascii?Q?yXKlvhalW7be3jBKlQGPiNxummQKmva1S5Hx4FK4oDorn95su5AXfOJX5uOg?=
 =?us-ascii?Q?RW8PEI7eZsq7JcI6Ijnw/o1dqJotLCgVdBOhhvO4oUclDZciSQ//D5LsLRk0?=
 =?us-ascii?Q?F+G2ZSj/aGVysLXvx3tWVYlkFHCBn7pfw0xLVsZ9TacwbmWkw5uUtqJLKEPr?=
 =?us-ascii?Q?FittNQbDln+uYx5QTk38P8l/m8tSl+VwmMrjI3rP6+1UyIeeq+vaSDuzUnH9?=
 =?us-ascii?Q?CpHd2EH+3bB1NWTMvrsM+objspsF9TaoajIGGXhThU9PnR2C5O7ZJi+me4Wy?=
 =?us-ascii?Q?f/80tbOi7kVKVJI3WeSKwsj1KoAQlHaLeE1Cks8o3qPIuFSPxYkLHwBVyeBZ?=
 =?us-ascii?Q?1bsOzQKXKfKPcNZvhRj0hKKNdfXMbe0hKe+selPgFtlJ+zj6jt3h2cuEPcKU?=
 =?us-ascii?Q?vpc+HqyjatnOtI2s7L6/Rgah5SICchqMHJxarg7C6cdqoSK+gxBZhZ0vmU9Z?=
 =?us-ascii?Q?ZsNmFoA0IvZftpoaSS3d9cencgbrifum0iwpt1YybtKbM553Cz5yQnYIAh6/?=
 =?us-ascii?Q?0WLNpta24XQXub2NMPOQczXf7wEmDsLCaXQ0FHfQi89OOqvxd4q3WgYQFNsx?=
 =?us-ascii?Q?ImwUNljPoQTLew2Ll39Cpou/xC+pRiAuWn0TWRu+I5yy2yhCB1672tZ3XpdK?=
 =?us-ascii?Q?brdi7VxBVnIUmHfKwv3F5nMbeGUsiZEBRdr5YUDwmQ9eC/s21UMZ4iB+slLL?=
 =?us-ascii?Q?ZmuWHo9//zAkNFmQ5mtfXBn/Xvlt0pRd7+v3qikPhyid8ssuZPTy+D3A+wu/?=
 =?us-ascii?Q?g+VHJrpJ1phXK1zbTxP3HJGMztYbiig8dMH4w7Kngrk7iWjiRKL0QyXV4ZT+?=
 =?us-ascii?Q?ut31fhsVwTSd9uNKmZxtgYHlPJTw8ODCAdBf7N0aoeg+4a3M0q242cWO2R7i?=
 =?us-ascii?Q?PRI0ouZjwgBGFwdYpy5+soLP5Ich1cTNJVthDmCcquIUyBuJLxwN91UCD7AE?=
 =?us-ascii?Q?UYfgq/01MCRon34LXk6UIAPIJyFfgM8CSZzpkrEE1TtdhAh8exG1o0KpK/wB?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F8WyNI7nQRRqcV479AcCiOLzz+xuSbIstHhQzJLOM60uc5Mr/0BuHuYEhruMcoXEZh2FiymDIxWbvHWb3SVvRGb8oDKOPhxiO9OJWxnuXt4ljxKYJw2b4QC7efxYLtGY7/lHPmnk5LGk2z+VEYTSCHBwV7YsDhuZ63G5/E/pNuEqtd/G+hhxDBsxcDg7Gnw1eHOI2B6xImPH+/n7worGVEeeDvGeQFJHx7kt+yN/6nyXbncNm/TIjjTFX4v5o3QNUh5maN67ny2GSQEUbT81oTxh2bji7miIIKFefMBWm01f6cJbJ9hNQ5HHUKGaZUMbNspb9rsOVMURrcYUfI6vcgzje/LSxYGSZtoLo84IejJQAXoehi59BYUdhKK+GlLNd3KNZCVk3VEk2HoNzMj7/TECROhAILalIOSeEZK8qjX9Z318TB53aokBwc2iOSkoYxD5HVepRmUm2gcR97uHMyrxelksr78RYpGNVwmCkpi1lzCpiqcBzCff9+3lDbZNVErjEWPr7z4cO39PQzynCi2RqjyAplFBVDHihud5Q1VnJegAIdqVTQTmuXGLB1SfyNNvT3yXZ+b7Ae0iNBTt4BCx7xgWS7iTNjW+FQR85mc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e93e7-f133-4433-09f3-08dc8c6ddf8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 12:31:11.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93jm6Q4G+pKJmMG/zeO46Y1ZD3kEyJk/RBCl9RXGT39tUuVeMyxzZcnAVHyb9KIq1+6zrhdpk40i9CrQJ8fZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5044
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_09,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140085
X-Proofpoint-GUID: sfSisnql1xggwokv9o87kMdY6laWKbdA
X-Proofpoint-ORIG-GUID: sfSisnql1xggwokv9o87kMdY6laWKbdA

* Jiri Olsa <olsajiri@gmail.com> [240614 03:54]:
> On Fri, Jun 14, 2024 at 01:40:54AM +0200, Bert Karwatzki wrote:
> > Since linux-next-20240613 firefox-esr crashes after several minutes of browsing
> > giving the following error messages in dmesg:
> > [ T2343] BUG: Bad rss-counter state mm:00000000babe0c39 type:MM_ANONPAGES val:86
> > [ T4063] show_signal_msg: 16 callbacks suppressed
> > [ T4063] Isolated Web Co[4063]: segfault at 396d1686c000 ip 0000396d1686c000 sp
> > 00007ffd767b30a8 error 14 likely on CPU 7 (core 3, socket 0)
> > [ T4063] Code: Unable to access opcode bytes at 0x396d1686bfd6.
> > [ T4211] BUG: Bad rss-counter state mm:00000000cd9fc541 type:MM_ANONPAGES
> > val:817
> > [ T3798] BUG: Bad rss-counter state mm:00000000432d87c2 type:MM_ANONPAGES
> > val:181
> > [ T5548] BUG: Bad rss-counter state mm:00000000034aa27a type:MM_ANONPAGES
> > val:242
> > [ T3823] BUG: Bad rss-counter state mm:0000000099734197 type:MM_ANONPAGES
> > val:137
> > [    T1] BUG: Bad rss-counter state mm:000000005e5e2f2f type:MM_ANONPAGES val:28
> > 
> > (these are the error messages of several crashes and the error seems to affect
> > other processes, too (T1))
> > 
> > The crash can be provoked to appear in ~1min by opening large numbers of tabs in
> > firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
> > error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
> > reverting this commit in linux-next-20240613 fixes the issue for me.
> 
> +1, bpf selftests are failing for me because mmap fails with:
>   mmap(0x7f9361bc9000, 4096, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 4, 0) = -1 EBUSY (Device or resource busy)
> 
> did not get to the cause, but reverting the 1c29a32ce65f fixes it for me
> 

Thanks for the information, this sounds like a much easier way to
recreate the issue.

Regards,
Liam

