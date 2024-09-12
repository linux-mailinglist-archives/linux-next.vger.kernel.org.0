Return-Path: <linux-next+bounces-3804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02A976F72
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 19:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9944728174B
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 17:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B184B15443D;
	Thu, 12 Sep 2024 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G3c9Y9nv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ImWiwG4k"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443415098A;
	Thu, 12 Sep 2024 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161431; cv=fail; b=bVbgHanWdm4aEuCDbewNM+dqqWEyzRbigBgn29Wps/B3CiA0/QhNKpc9cNprGDDZT6injFo70WEnDMemicWPVheGerwCQkFC7RScIMDfMy9Y4udvMe/vDfvu92PBXli/+2ScOyLQzP2iCTEyr+GSlw4jEe2ufn0x7EMY7rEXmXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161431; c=relaxed/simple;
	bh=ZV8yCpGrRwBUdGAcwHTfh4yVzVB+WWmri5b0vxtAuuY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mQGYENwT2JmnFbreuIQt7xrBiP+utDFnGEw5NeA918dlHJxWGXlCnNngGIP6HGcUXdGtPUJoqOFwKl6S2sBqwvCME/is2eFkv1XQ+KW+AEWjVBKEk0CwoRL3HLbWNh0d9bQFoQYWwAI5MbONqFGUTNbfYZTfg4nWBTSWCoYMeiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G3c9Y9nv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ImWiwG4k; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CDtXuZ019834;
	Thu, 12 Sep 2024 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=C6BY5aE+Z8Tuft
	QAqqKdAgJabxhU4JwkZfwq0fgpWFc=; b=G3c9Y9nvYWkTY1R1AuhPtti7G7IDnH
	EWxHg/dcyRaCb8PjkkER4AFps2dkhkz/9mIuIjXCM46RTY20feZq4G+qhbqMbKQM
	HWVl1epShtFR5BmTHMtl98RM8i06KRDFwOGGvSz29XGYpZ4XhL2584fW5Oewjqau
	R0/pcNvTYa9qukyLRrk+v4pQBwBkrIc6h+s3QIhz8cciRi0BXDU/P6CfUOeuV/4w
	h4riPeOYjTWnfSllJXt1EuStvbLyH79g2fTJ9TtjNxti44WhjQlJM/SGjJ6M/CH9
	xXMQDr1tFkn7luzwMvCkz9+zeMKGyopEWiixJ58vqVSUw5lAuKgEmqWw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gde0bhup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 17:17:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48CFmi3g019939;
	Thu, 12 Sep 2024 17:17:00 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9j4ecg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 17:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJGe6MlNUH+Zw4nzDFHGWNTC5JBmySglCL/DZRDwEKGdx3u907EBOkkkgkwaFC9DsUcEsUS8GmxLiKyix69TV9iAPtiQsmJ17NlpigBSI33VEMEG1nwwWVTmhFabvTmAYyuL3/MmuMbXD16mM6cTt7+Jx32HG3r4X2QpbPrYp0/Sx53B/B0pXW/9R7OpnvA/p5eBwmCcZi480AFS2thnv53rqSawSg6tcabwrvgppn7Pe4+tyShAwL2z6Py8L3WWX2qB/3IgY82mv1lVC+6vxPkHyjt4cOkIoTOrE4GsOeztTwWAGm30+z9vyuvUeb0hqmZyPQKg3oNxL4Me4PQqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6BY5aE+Z8TuftQAqqKdAgJabxhU4JwkZfwq0fgpWFc=;
 b=J6kCcodSyed27lWtbiPfBG4fS343mQU1x6TTpoVPo3dvtla7yn4s8KAqG5eYUenEdXfpSDDRShdAjIMqZEzHxIxHG2j3sCD2hXPOlgQ3V4o4YUkPKJHc/XD0Y69qCO+1j/lPUIKK75hX279tVRsYFWQg4iqRE7a1ThhzhlkhRkMhjyiQuKnZuvooC1VQ+ylPQ/wH4llRpMmTDbjUa+xQryNJUBk1GKZ9gvkZtl2Qdk8oWz/+Wp/r0ZvEMbjMH7QbYPufAFz5hTAFpCA2abn2Ok7etX63qSrpgWBRVLWSatN+aRtSdJe5sphfSz1UX6q4d4HEwx9Xigwfzue7RbQ7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6BY5aE+Z8TuftQAqqKdAgJabxhU4JwkZfwq0fgpWFc=;
 b=ImWiwG4kLSvojNOIleo3RFIbKDfMw54Gzf5FbdWC2vxEk2ONcEUk8wZcwU5fqrXLLSCN4SsNDffVtUJ4kuealnITOaPamljD8zQwTwS1Ng0vxG9XUliv3uctfsW7AuAtJAzrSyHKr+ejH2GEgHQj+Gel270RqwnfMAFXqkxf9EI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.12; Thu, 12 Sep
 2024 17:16:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Thu, 12 Sep 2024
 17:16:56 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] kbuild: invoke generate_builtin_ranges.awk using gawk explicitly
Date: Thu, 12 Sep 2024 13:16:44 -0400
Message-ID: <20240912171646.1523528-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN8PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:408:ac::43) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c590a7-5fae-48f8-6a4d-08dcd34eb40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PiG9ispfoV6qhp76lfYV8+4DGWvuVQJK/mLzpj2U5jhUMeFxcqnR08PJIDju?=
 =?us-ascii?Q?AQUWmkrXh81OTvu+ab1OuWCDzpgALA+n48OltYamczm0w9R4ey99Gi2SrfNC?=
 =?us-ascii?Q?8jQNiXx3qLrPrM4JMa/JkR9bBrSZKuIa0vBRq8Lvu+0O4lXZKNq2y1clSBgn?=
 =?us-ascii?Q?hK91hJS+RVdiDcKvqJtiESWm5pkmwVRU11YFCDLFovGGTd3u7u+I+Q07n2l0?=
 =?us-ascii?Q?4uXYw8De4ofosAv/TIPmPEx3OCbfYLVvvMUt9Gt3ShHK7CIP8CQ4i3vyEwH2?=
 =?us-ascii?Q?gfqUlrHtbzTZyb85B4Lt9AjGNZbVRcp5nO/KBtw2uw48LbFQUBBVDS4+fzAd?=
 =?us-ascii?Q?liRtQrAGZOYQtNH9x7X/EfypUClm9P8P/lHHc5V5SxWTvCGRGW6FVMcLQ518?=
 =?us-ascii?Q?3rM6eejdFLF2UfvYa3g6v/27s1bhmNSBC1hSdSyBq6UDbpM7xnGfgfyNG2yE?=
 =?us-ascii?Q?J5SnbVv8yE4Yrh9glr28D0dNQCwv7cWQcSsAOOFJkO4cPhoxeeTyg6F5EQhT?=
 =?us-ascii?Q?29eOcJ6AxxNXwj+rhJfVPNmB5HwZjoWySFQYgIvb/LnfqxzvIP0T/dKD5v/7?=
 =?us-ascii?Q?2y643ucBwsW75R394+hqcyDAgQsxnkRhQfqHpb00EEqY0ZwUcu7wEfaJ6koE?=
 =?us-ascii?Q?IQybcxHmwBmvzKAuW59mDIr9sRkPe/vA1P0EDYcaZ7A2ZcvVwCdkRJH2f7+y?=
 =?us-ascii?Q?KWkrFmI43VqyYTj1vgX9ljrvIgssSmb+fDRPnt+p2+ibgqOLRX2MYrv50Sip?=
 =?us-ascii?Q?HRuEMnl8kCukNdiSPDkk7LUI9rUn3Hre998z/zxpNZGyucsedTMlUQFTZipJ?=
 =?us-ascii?Q?eu5akI1eaA2juhptGaKL2PLDZGnMNvoWXCM9zYaSBnjGk+Z7dsJEnb/IuhpD?=
 =?us-ascii?Q?HQebj7Wc4XqOMcxZVUA0/AHAKAcsqdTKPlMIHY7/onF+7i3NqkyUWo27i1G4?=
 =?us-ascii?Q?gNMIsFJkkdZM2YsOW0RM8JQMvnWufSorZ3JImxQZbvgGFmopt1hWkjkPRSLd?=
 =?us-ascii?Q?tXdUGAP79I1B+EIAepqsRB42UITB5UkETzEYbvGm+mkKCbaikW6Lu9ROmxJU?=
 =?us-ascii?Q?a1b3sECpGmi8foKXfUK5teV7Wdn8rS+BUyE+xYncnJkEGE/cw2WwrA+AxaIC?=
 =?us-ascii?Q?87QrtZ0ngFMej0c8hblxcScYFJ34qzE6fI9KMdD8UMVYOvn69GLj+viTYUqd?=
 =?us-ascii?Q?TiHPkFI7/IrQCYzRJZxBIST5B8GoZaqQCyAePVaIcZG4RkAWNe7n7TRcyu8R?=
 =?us-ascii?Q?HLaCz/gaTNamwTege1U91D0hgKfp96AUY6nS3LG2P9iFeMU0sfba1Ze9MHVU?=
 =?us-ascii?Q?64S7A6bZEhSr6P6y3YAj/Y81IpeRJizrHWd8SE+eenaxVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zyXpKw9FjFn/0Gb235ekhIh/pGbqf4JKd0YqwbZG1LBqqnkeCug80cKBDrV/?=
 =?us-ascii?Q?P3yq+rEuuT3Je0LbTc4em3PdD7TfbAR/J1FL49oFzUNwxkruxSy2RYYDLGVo?=
 =?us-ascii?Q?XXPNwZSiBNUY7z7FG5NetqJKuc5B8c68m/YM6G2wxWhmuFoY0OkXrZqrshm5?=
 =?us-ascii?Q?GDvIMsVvwdDYuJelz7oH0JgA9/Bb2Yg10InoehPat8CS6aIyfDVNUDA1oequ?=
 =?us-ascii?Q?KVtzdOHLjM3wI0FAHqsBDD81HBfERyYetKnG1PwJT5+v+JhQZi54xcweZwzo?=
 =?us-ascii?Q?AzRhc0cXbJBcv1X/PST7xx6Lo+0uukYxSNtCpTlSP6wJ6VVOsC5Y66AtXkZs?=
 =?us-ascii?Q?jHGVs6VmsUfm32BP9R2F8GX7vZwE1FRZ5A+9hqjwM27aTncsatBka7f1R04K?=
 =?us-ascii?Q?IT3DEr9jBwqffMxs0rX77nUU/trluN6o+F74ULRm2Y4XafeqzncVElqoH2kx?=
 =?us-ascii?Q?OvAR6nvk1Gt4bhQiO52KwD3EDdx2eltu7rMhNbS61rXbif47p7TrnHT+5CYl?=
 =?us-ascii?Q?JJgv3NwdPNIJCT2BqlGDhMvpFYXynmcYDbHajrnNL+JLsDzQFx03MSwOwVli?=
 =?us-ascii?Q?uhZIYpWBOF5IbQt2EI/2caNZtJAspwiJkmaBhzM1NJE0qqpxjb915vNl0Oti?=
 =?us-ascii?Q?1qaqzW7trwKYQ++vfFtIJ7TwREgDIu+InGsNww19DtTRa1Qhd6VvYSmdZS1a?=
 =?us-ascii?Q?a0//S9pKBN7h0VGw6On8BpS2Ex7ZhXWFWuvrv4XByhg0eb1jxLyCX9j+EJHJ?=
 =?us-ascii?Q?L+i1lxVvrLT/YGOQ9nYIz9205PGqlgx/liyy6Fsb20VBRSMae38AvyhRcFzU?=
 =?us-ascii?Q?LmpumiCvviWv4RYY2qrgRZpuFqTk0m+mUQih0tw2A12i9IY/3jJ9j9rNndB+?=
 =?us-ascii?Q?sHSLxitGAhBwBLp0HdSgPrOSOSzXbO/8z7cduQx1VRLogYLK+4imXJKdzYgl?=
 =?us-ascii?Q?29hFgYnDLWOxyK3l6dtOMXVzM30o65WYN+MZ3Z+4+ttaPn18gXBH6hc2Hzw2?=
 =?us-ascii?Q?0Nv59MFLrNxm4qDVXlRO4DIHeakRE2WkHotT4PUTzZE5lJzHZS1jtErJbACI?=
 =?us-ascii?Q?sBTW86paQCz6jY5tvSPViXLdausDc+7UlY0hojZUi73+E350NQjXylu6u8NC?=
 =?us-ascii?Q?LAZj18qaWdI4RSKA+t8fJZN8UHT7nym57UbrkA8JUk4jeb99OyN7WvWDd8/z?=
 =?us-ascii?Q?H48kPqwNh3gl8OZjrWrmsR30yCTzLG2Tur3id4ffJCQOeRPH2tE5IA5+waYC?=
 =?us-ascii?Q?odCscB7ytY/D/Gwfvcr2dMIDr32pEfULioXYLQB7FkoyDjJ+tZbgO+34bwDV?=
 =?us-ascii?Q?j7K3juD5wgb9b3yIans53RRE1H9+saI1rCvsfVcPvPGzQsZf2Y2/IJ0tInXR?=
 =?us-ascii?Q?xBct1UwInnf4hXscfNu7Lj9+wnt7XSb7Nbz2n5HKutA/YSlNsabYt2ObYLcF?=
 =?us-ascii?Q?UscgudY6sIz3ck2jU2vhkFNh4ygj2Csl1tMH8aQFA19BP0CT0S+WnlM39ACu?=
 =?us-ascii?Q?CqTb2MJf7Mv9poBTbNB6JmFI192gT7D25dGOKrWFdzel+isUkCJFlpbbIDvj?=
 =?us-ascii?Q?4W4E+I2BU38428BcMh8CCSZgO4jOPojGFMZKWYnIv5V2G8hhvF8CNbY2SUx4?=
 =?us-ascii?Q?mF13kQ1t9spf8T9T+QXeLTA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X8f2La7UX0Q4+1np5FwYU4E3F7IgG9qhmG2ueObnLKS/cO6TuzojqKuCPUfXdzVGTbzECRMlTQMYccZSiVzz4LI0n9yKACmL/0lWPNbpNogd51hBwJtf2+ZCKycjiXyYQnZUb57oRKIODDQPk8VX4B0qvvjvTfQ0DjmQfK3iy8IeccA1Ba6vE557k5/X0LeAAg0V/XlC+dGxcmLtvaC4TZgJHqYw/LeDuIv21vsU8Wv1QBcGZho4/rEO7Yr8dk1l42E34ClHRuL6OKv6wiIpv/VCOVyWJVcU5nerHvfqmKEZKj23zpXwl2+5ahCr3+njJhOu/u5p7n/dB9z52UP0ZHx1mFkrWGpQ2voHqzoeakjgtwIz9MArohqJZTVYcfkHThn7Lx1gyHpSCLdmN5sBLWPu/58MxigCbtBZby5saVL9KwNU2STMj8XSnB44KAZcHX970Qq2DkpxmiPD1Hd19/sb2Tv6JH+GRs8OKOnyOvcpnyLkPsoEMvOfH6BPY5bPFqtmRi/1t/NKzAcCmfyIbNSFoGPljP533ogfF3gvZTgxwfzmgkwRUVNyTz2oCNzGpufIGNCwBgWxd70wxhXQOeH0N7cbeY+7oKc5HDObwlE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c590a7-5fae-48f8-6a4d-08dcd34eb40f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 17:16:56.2491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENxdJ5xb9n/OEg5vXAJ8DXOTy0wqy77I2N8JB9hGoEMO2nDYH8VyBput+UeyhYHVpC73jbEV1G5OmoBotxatX+Tjb5v5qG6LAtb4dDQJqlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6608
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_05,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409120128
X-Proofpoint-ORIG-GUID: Kw7YmdTzFochE-YUjln0bq4mt8y4Ouvx
X-Proofpoint-GUID: Kw7YmdTzFochE-YUjln0bq4mt8y4Ouvx

The gawk utility might be installed in different locations depending
on the distributions, etc.  That means that the locations in the
shebang at the beginning of the generate_builtin_ranges.awk script
may not be correct, causing an error.

Use "gawk -f <script> <args>" instead from the Makefile.vmlinux, so
the $PATH will be used to locate gawk appropriately.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index dfb408aa19c6..1284f05555b9 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -39,7 +39,7 @@ ifdef CONFIG_BUILTIN_MODULE_RANGES
 __default: modules.builtin.ranges
 
 quiet_cmd_modules_builtin_ranges = GEN     $@
-      cmd_modules_builtin_ranges = $(real-prereqs) > $@
+      cmd_modules_builtin_ranges = gawk -f $(real-prereqs) > $@
 
 targets += modules.builtin.ranges
 modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
-- 
2.45.2


