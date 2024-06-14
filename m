Return-Path: <linux-next+bounces-2555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB808908BAF
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 14:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606CF28340E
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF83193075;
	Fri, 14 Jun 2024 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UuI3UEGV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YVxETWMN"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9AD7E574;
	Fri, 14 Jun 2024 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368234; cv=fail; b=HUZLrEwoYG7S4Rf8CJ9EWcDDLkKiYzKj2UfRDJGmvm/n7ylcpPdY9t9eqVfiZ4WCwE/jN3p8yuHX9rww1lHmOCLS0dm6sUeuLvfliFOuSLJahVBhoECEXLUC6tGVZhbPy8ClN8CNufO+0mERefgI0IyspvbRMnD/AB4qbJI4aGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368234; c=relaxed/simple;
	bh=YRlbKjh9x7t4yRrjPEke54YWb3mg1e2ufNkMuM35CIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TuzNbEpgkPZi70fHcYkyWGLpvEiere8B2akGGVNj8Uyis+ln8UQD8Rj/bP1pNcBo1CxAfbnVjrC6CKmFKiIZWNlGtl0r3E66OinG3kJwFu6ATQArVXiXWEJmZhGLakD+GKQ2yH826fAmTimm6koJq4dHi0H5H79Eip9lAzXXP7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UuI3UEGV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YVxETWMN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1faXQ022872;
	Fri, 14 Jun 2024 12:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Nc/4RKCYH+tDPlu
	SIaJrkcvWZCcU9lrsJWaxT1593dI=; b=UuI3UEGVDIepS5QuYeBUBYmwRIwOTZJ
	5yigbtb6qQM35auJFOYiUqTBlAlxYan8eMHZK3ZmPZeZsAKkQdSqvkPdZHQoKo/G
	QCI+aKC1we6qf2mdsdSXELcJea8C/ToY2bX+ShCnWDZe9h1hLCfjoJdeFyMeNDQm
	BujDRRHwdFL7ip1dBpnaQBf89BLuapv9E2z0W4RBdy6Shu5eP3iUit7+jj4sE+we
	Stc1/KL5wxJyYo+AkGNMWQUE8okLUdhMKwVw5zDpM4/IIdnFZutUWPUMSXQxQ5Kz
	BTJKvm2iMk4NO7jja4thFqTfiX3HWaoAGqSpmuTadfCzhZcPvJqTPvQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7duk3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 12:30:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EBZNhx020030;
	Fri, 14 Jun 2024 12:30:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync92hm87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 12:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy0xrHhCSC1CZqHIYzaCOvGaPbzDZ7Z537nrH8H8/8PzeR3FZeTG7oaKB9TST2UpS28N89lw+6lhM/94Cq6HUTPK1kR+4qPgzzZgxHAf9WdXMocyIKAjOFqoRszBmcv7uZyC6TIpERNcV594s9UzEnd+40lYci+Vg6g376vGVitQsqerCdl1y/ZvTLecrED859GbBst89E4R41RqqV7mhVn6x+oMl0O9GRPkmmNOMN4mz9/i3y4OKcI1wKt+tWezkdlnwF9h+yccln79ukhGCRWODM+T3hGYsaS0DHQ8em3f6PpSnkC7DMOoOQkj06wch+E0q/2yMOErvhb4ucnWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc/4RKCYH+tDPluSIaJrkcvWZCcU9lrsJWaxT1593dI=;
 b=U4/Jj2g8FCNcBhl+WYn8exB8n0sNfv4L5YHkBcpMnggtdfDQhOAeE8MnHjLmYBOhJ808bCqPTT8wcYyN88KZAmz2v3MQs5T7OgzhK0rZ6PnjGuV1SYCrBxDuZqBSOONzTW6Wpu44s7BHF2oqv7jqDg4dc8apT0W54LptWRpD9AyO1lB6nn8kMG9Q5lzh1PT453fBHmrhqshZKdgcyarqN0ZuLQH3Vk8e/dSW4bM+RZdTadvVLdM6Adq1FTjL/sFnrwCwmPNTSwgaHBXHCTJiUzkhnIHrPsxcPsnyAJ3LE8Nuu0UKiX52HmjE4j9SXVQe1u7uLteFyhpe17Wvfe9QQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc/4RKCYH+tDPluSIaJrkcvWZCcU9lrsJWaxT1593dI=;
 b=YVxETWMNKeZQ/08mMh1E/0ujlvF+elODgvj9iXqyLdfiaAcUeuPcs7Q8YrvE+yioxNL+fxCzad3yHv+DU75o1okch5jDBHU1S4QlCMqFIG489MGoHQNAV+x/Q9GRrLEn/UQwYnztXbSu9wh1SWquGHWCdlzv/Mt3PNb9wG9GM10=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by BLAPR10MB5044.namprd10.prod.outlook.com (2603:10b6:208:326::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 12:30:23 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 12:30:23 +0000
Date: Fri, 14 Jun 2024 08:30:20 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-ID: <w5uejhiciolye2ikgsdjim25z7lau7km3tu6t2vby3kuxeshos@osowmu4ecng5>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bert Karwatzki <spasswolf@web.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
 <20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
User-Agent: NeoMutt/20231103
X-ClientProxiedBy: YT4P288CA0081.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::14) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|BLAPR10MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4b1a5b-ae28-46d1-2d15-08dc8c6dc310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NKOz6bPW0s9PTPAti+AxUZXQZLXvSfVcaE+R9QYUT6/V1KDT0zzJKIcl3lKW?=
 =?us-ascii?Q?rDJY4QIQqR+1XO1tqMz30Z342A35Xk6TnWlFsnSFMISnAzayUhqb18DcGrpY?=
 =?us-ascii?Q?hXYy1074OpqCc5KneprhmJ2OMHHlfIojfbXaZTeKwAVwwyncK4ZbfnIA66QS?=
 =?us-ascii?Q?1ghn4LIIiLFHl8EGuqV6iiVELLbCr+i7O/8Xrgut4KBgHBWBQmZPfsl6C4cY?=
 =?us-ascii?Q?6Y0OBuTJYTjb6jXJFTe9s4C4LIQB5rpeY0RkMN6UsaisRVITK4sQuhm/elsS?=
 =?us-ascii?Q?4ebGmjr1sciy8kPrc58nmqBVtEo+xulCB7qggzdzZ23MX8VD4PXBYEtQjfKb?=
 =?us-ascii?Q?rBE9uprGvhV5Z7Up7eJ4wvX9dArlSYAyIe1qyKuDEYz7BlACCodibTTvp+Xx?=
 =?us-ascii?Q?Vbfs2Zux++glO8mIWlC94tmLFhH4y7eK7ZI152WYxWPWuGM9THZGK8Jv75uH?=
 =?us-ascii?Q?THIdh/LG6gToZ9vAP8jyJEEKfh9qGPhFbhn3FQsY2x+ZgrhPBqkN5HYNmCL5?=
 =?us-ascii?Q?wHflCxnrcjTAjW8Q4UdCaIQ2ETzNJachBFydqvGuL/OSeDA0bWELzZirMl8N?=
 =?us-ascii?Q?WMWjkvEk4e+ODl6FqSt5aVuA0bixcMeThxqYRpZeq3jTJM6P3m1qMCYuRAwQ?=
 =?us-ascii?Q?8qax4Ei4u47aNOkGxtsK/ksG0iVEejhT62tuvCQpOd7DF0IodCla1QLUAx4f?=
 =?us-ascii?Q?4I+3BPihHlVbVfOveTXIgPy5oo3/+ers6NwU4IHpX6i4QziuryfvhwUslvP9?=
 =?us-ascii?Q?ASj1DSxJzrnkgPsKxMU/Ab7RmrnUtVd2XnMou4JN2iwN7yVdwCCvU+W8ctnT?=
 =?us-ascii?Q?rEJigkxrFQmTUMKO5a48Y4rSByyUqeBm9vDEoWJZDWHnMZef2g/eaVPxcs3h?=
 =?us-ascii?Q?rOoX3VU3ZLO4NrNT1fAASx6ke3bn9O7AvXUidVsvRRiMe5116pVIfZYU8qhW?=
 =?us-ascii?Q?fVE9jCAoQ1LXl5GhSdyFYuowCuM7p/QHwPH14ZO+NAzRMr7Ul/Ggc6LWItCU?=
 =?us-ascii?Q?sb/Wvk+ULVCJRWpfioTxLlPuDcgjtWp8vf4K/Tt1PDooZxAd5mey251w1SdA?=
 =?us-ascii?Q?o/uXX8QlNEBY6WOc6r+Oc3z6pYtA9Lo36kB16Zx036Z0NnzvjTYvRe3R+lef?=
 =?us-ascii?Q?D8n7GK0vrx4kHLdIxzicYFYdph/wbv62WxBFTaZJAaQrboSX7HaKjSzOZ+IX?=
 =?us-ascii?Q?VJkXZSoryWJve78uo8Z9H7jQbOarFtKtlH2jo2DwSgyzXlLZ7fVV6mc5+Wt0?=
 =?us-ascii?Q?fZV7jzKuzl/jJIa07EBPkB5UrV6+pwgvhaMD3ydJ0sIX8GhocZcpXgSuZNzB?=
 =?us-ascii?Q?3k2DUu/jqgauZuwwswgWAZZW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T2Ulpn2hBbn2WcOuaUCXrzf/KfUV9sJcEg4PCVR+WSqca+izXLjCxz5lOOaF?=
 =?us-ascii?Q?VwKM4ZQFCHVEGycPqU2PwFcrm9VYbtnCF0CX0eIyGvJmCsMD+ZpOuHCWp/ww?=
 =?us-ascii?Q?HL28PMAhdxRyE8aHutc+XnskNxL44eyLFs31TeCzl23DxkiVkpJX82DzFhQB?=
 =?us-ascii?Q?Iyn0SF1krUF4bL7lNl0CDMW9wmKNRfFeW2baw5HtJ5ESCKiiq3sllUPGOmb1?=
 =?us-ascii?Q?+weXyw4NtqR1KewSXPO40OzcIoTzDT7QWiF2ZLRiqJdpGo5q1S2coftIVfJ2?=
 =?us-ascii?Q?Hb3JnEH1Cmo1GoTxgvtJNiwvnEidt3HBbSnz7FiQ705+zKmPsK/ve2vkI+pO?=
 =?us-ascii?Q?xtRqlsgkZxaS1lU8fP1X4UQmhC0SSpG/C2maGzLEPKMVJueMRqoIF+1Vyncd?=
 =?us-ascii?Q?BJMr8RccAXSmXXK68rUVDH4KD9sUoehTMOjD2YG1XLKhfkQ53VzZJ7tPy2wT?=
 =?us-ascii?Q?afnuEaVYXKVft5/BGPCOP+uz465KSnJDkIgI9c6Qof18TO3Tw+KXm2x/7qWj?=
 =?us-ascii?Q?pT21cP464fMnmMO2hS0D8E9VBy0ZtCkglUuseyq/40q+oruWRN15fxiMb4ih?=
 =?us-ascii?Q?aDgJyOC/dsTQwUdBTguhCNtssmVEJaGW61VI/NgGjlT/7ZtPkkPaZvjCd0Eo?=
 =?us-ascii?Q?hhWGsLkM5Z/TSz9w+NnMPDAm16DX5+f2OXF/Ez+TXnN1+lF3D8k224zrGVIF?=
 =?us-ascii?Q?sHeNkr4xsHtbIeKdr8FdNrpugJx2wqacnQgdQfx/bWOtseR+aZSEDvZ067j6?=
 =?us-ascii?Q?dNJCjX18ar5sIZ/cY3VY2vQNCql9clEDueJSK5O413skGug/o5E+GiAz9eOo?=
 =?us-ascii?Q?pevNOUUwjwLmZ7tnVVyHkAHs0i5ZzZo3LYhl6BRJRfQly+UmlPXRcnXL8emK?=
 =?us-ascii?Q?ZlEYgAnmWrmtRQ84yyutVrskH2RWonks4ycwyZwkKmpU01aup+bbsMuXJnA+?=
 =?us-ascii?Q?RVJqBq3mskHLTSLjIHo99VCnGFuthg9YBtnqiplFOwDpDF3FSv1OxK4h/vYJ?=
 =?us-ascii?Q?btcjYV4QFJy/1Z0NMFinr5yEe6+3LTjt/9Zz/cW7q/naZn3o4NzfUoHpd0DZ?=
 =?us-ascii?Q?Ij996zesuf0BfsXVEmZXTBzQID3uVEqC3kWvarztisjjmpIm4/SlZu4xzBm+?=
 =?us-ascii?Q?g2ZveoTVQ76xed9ewfNHeBmVpp0ZRXufizp9zzV/KdRv+gNEyDmMCV67UpYT?=
 =?us-ascii?Q?NUs3Oxt6VfJWA0hDQAlvtutlXAXNLDPmH/K3j8MGen+UcXOkAdSXI3t5DKkW?=
 =?us-ascii?Q?msI7n6Ra9nk4ugVdttazbIMd9/mWNh2DO7760SayETQTB0LGNuPP5GiuG9uV?=
 =?us-ascii?Q?NJA3faTj1TATLpsWwJNI7z1CCC5VETBnfclM9STujNp5y/IUT1EMZJoISbfN?=
 =?us-ascii?Q?V4ubreEJcAtD5Pc/Z6JwhLpwflOvr1cSjB9XDWMTyLSOidDS/TSBT48e/tUL?=
 =?us-ascii?Q?Y4oQmjxWJH4tOGDm3N8mq2eS2B+JDKsJ3KKJNTI3J2aO4yZ9QUoxcFKDK1AA?=
 =?us-ascii?Q?XcXlQv14cuVguIQXNnITl6dYv6NWONRx4kZCK++z9vBs777SI9qALKo3Pg4J?=
 =?us-ascii?Q?FvBR1GCrPOKmIPq0qK0LWoFYuW3YIL96PApQZ3iw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	m7hLMG4lTMukq5GI9PTxE/h5IYuK1S37huy1U8xpaUOA76ynMGSJWsf+dvu5zvBKWLv6b+/L99QZTCPAEWBFtL6IWxIWx5uKSQkDjRGtWj6eXzLqqx/XOR9Ec+UcUgMAAnVXRX99K582OAL4GQ3JoGNFN+7ghemZiSbR5WrynXsOidawEaVqTa3wCMWIfEE6x0RlsZ3aytio3q0GCGu/wlxSxkKWBy8vEW61DthTan0AkIwgZUoirGMvDceovp5fvAZCHydH5iYYzwFaKiy2R9JVaSOAm570cY7eGGYnLifg3kzjTG1U0RyAbhvinO3hyqD3928/r5fpeJ/SXEkHoG59RDiJHbzA/vON3sVveIxYmqVpwxaDNjZa3BUQx20fw7LOiNRz5d9o23YkSGYjuDXLmzsx5V9MB47JE7Z4ZWwqokSq1fdC7/kd7j/5yRffr46Sj8P/VSk+TLFWMyjrPsIGF1F3SiM9i++vPyqmr6CSkUK+b/dYEQKi16e1TUQd5QUnf7dl8wvrcQ0oLDFT94dOIdpN+kSf4azsRZ/SLBVztYiVC5Nppy51eKeilu1U6aWuL6B927FCmty8apbM0UI2ZeZBUCGUY2ia+kbrAMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4b1a5b-ae28-46d1-2d15-08dc8c6dc310
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 12:30:23.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vw2dgCuR6XF5poYzrY7Per7TblXr4JE6MzRWTypzUT7Dz1G5PktHl9zCTUGL2AcZH48S3v/9WUiIF0YpgdqqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5044
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_09,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140085
X-Proofpoint-GUID: uncMMp66nCiDCu2x1Dyrsv64mSEOkGlS
X-Proofpoint-ORIG-GUID: uncMMp66nCiDCu2x1Dyrsv64mSEOkGlS

* Andrew Morton <akpm@linux-foundation.org> [240613 20:03]:
> On Fri, 14 Jun 2024 01:40:54 +0200 Bert Karwatzki <spasswolf@web.de> wrote:
> 
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
> 
> Let's hope Linus doesn't read this.  Why are we nuking the entire
> planet just because some counter went wonky?

I think I know what's going on, and it's more than just the counters
being off here.  The counters are the symptom of what is happening.

> 
> > (these are the error messages of several crashes and the error seems to affect
> > other processes, too (T1))
> > 
> > The crash can be provoked to appear in ~1min by opening large numbers of tabs in
> > firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
> > error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
> > reverting this commit in linux-next-20240613 fixes the issue for me.
> 
> Thanks, that must have taken a lot of time.

Yes, thank you for all that work and apologies in creating this
frustrating situation.

Andrew, please drop the set from your branch.  I need to write some more
tests, but I suspect I will need to do some work around the vma_merge()
function, which is never a fun endeavor.

Regards,
Liam

