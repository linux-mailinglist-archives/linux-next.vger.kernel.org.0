Return-Path: <linux-next+bounces-2978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9C92FDB0
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 17:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8970283010
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65436172769;
	Fri, 12 Jul 2024 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lt/Bi4bs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J9ooajMZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8E317333C;
	Fri, 12 Jul 2024 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798699; cv=fail; b=Ifzubcvcw28rA51CA0UOEl6CrQvguZ6qxync34CnKdCPK5bRpo8rM4y9WtTjJiddRTXEKQNeO8OoRQzABVojjEhlgr+mgYx9usMEK9nmzZxtlEX5824PZtfRuqKw70VmlV0X2OjdiADAG7IfDkuGGiOVqSVW7KEhCypgvif5mQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798699; c=relaxed/simple;
	bh=w6CRMI9+mjAXfMcMVKFiQp0A8rrd8IsWUmS3iJeizuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePpSWaxAKOGo46N/h/VtBOYjOfUM6/IfE3NgLDEqGsTpftFL1IFWWAWWBNhsKcgAOYJITtDBsNf2vy/9ncz5PrXyTWzK0JyOvCMzaYC9F8XsqydSVwtXFxPS/YFNrttSBe4XVKwNEJrCJI63/Wmntc5cwXMjn1xny9UV68vRLyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lt/Bi4bs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J9ooajMZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CDIK9Y014274;
	Fri, 12 Jul 2024 15:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=VecBPN8eoKvIHQD
	jehUzk11erDkI2NjrQoHOdkpCDws=; b=lt/Bi4bsMY+JjdVkLELi6x5BP7X7YAw
	dbZkxvyxdKxi7WLsrqynWKeO0e5TsfmGjyoQRZI6L9/5yg2jegbz8Xye6HFJzXjz
	7JT60aVEXq+9x4Dj5KjWxa/W86RqZtq409iHu48f48ZON7bojmkpCpUNlb4WxlVv
	/jwM8wJvGSK3wfJnxQBMsx/h0prPxpUCwKi7rJh9yH23p2pRoZ9zj4jlAa0Da0XT
	iloOdBTksID8qZg+zSiYsNuAacBa9dIbkQ/5VqwioOVcqJGQRGO6x7cl8ORosvyw
	XJzOaysIDlcvCfczNItzsSBbFeEWCwukjSPKhlX1WnkGwmxUa9K+ZIg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wybv971-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2024 15:38:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46CFIIDt033838;
	Fri, 12 Jul 2024 15:38:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv3pvcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2024 15:38:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfaeIh1XhYVL+j+xJ04fB8dN1Me9QVtC7gpWhZ6ZJwozsQIoELTj8I8g7chQItcAS7zYlzounMmjUrXymlRWqLOQiieWaZ8pyZFuELFce2SM05V3KKKCD8AGnwJGMC+zS4PmEcZGVr3lAECu082e/eQXn81lqpTaf6SYZivfWoYDMB/rTYJnW3+hksX2mHDZz+Nq3UR+v+tVxH6DslWQ6OqXENIkBHxYnm1K57WEXvpNNrvw322HpIl4zbBDPDuXxLEuxLisbY0MZbDBYSBX4OEzZYYqAHfjgJH/wDFdj5MC3pt3IFY7HMa9hfcmGMSH7Awg5yjk0qlosaq/Cm+xIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VecBPN8eoKvIHQDjehUzk11erDkI2NjrQoHOdkpCDws=;
 b=kqiQTcFisaCvrPXFvWtwectv/m1kOnK96Fkq5jihS/FCd1ygYlXXGjKhL+UkNolOh5xtmL+sG+HxUl2rv4RXC0mU3a6wzJMJH0yLuAobUz1DgwnU+o3kCKThFfjYB70+j65UXIK2v2zY8vRnXktYaN6bDGjQk1jN9YmM/S5fhyFNTRHTR/34I7i0Q7zDQuFRHPJY4TEHXw+PBo27tSqhqqc8jiyaqjlwtqy7nCZGRnchDbRklkecz08Mzch6nN06MxT9GR0MRrcFZLnv6wbMWxZ5/PC2iS9+iaWgXPsdUZJT/4YWJsJYDAMBCubKfQC7P0OkfrxhDPmHPpTYQ3kiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VecBPN8eoKvIHQDjehUzk11erDkI2NjrQoHOdkpCDws=;
 b=J9ooajMZXKd6vs9TFd15fw9VJ8LgzIyMS32jyNvdVuXXk5+2yCZhuXqxhHb+863leRwTO4F+ZwCAq2A+Tc1nAphmV2q3Wr5gLfBZN75OKisaYkgHkwlZOjbFLNue2yfRQiSCNKC5vzZZft2kNKopjBpwltkOjHJqcSojS87Er2M=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by DS0PR10MB8152.namprd10.prod.outlook.com (2603:10b6:8:1fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 15:38:07 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 15:38:07 +0000
Date: Fri, 12 Jul 2024 11:38:04 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jiri Olsa <olsajiri@gmail.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-ID: <eee7hvd6vh4v65ta5fl7iacth7yesvryktxouu34uy4cxpxalm@ngeeuayw2lxp>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Jiri Olsa <olsajiri@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
References: <20240712121800.3049-1-spasswolf@web.de>
 <20240712121800.3049-2-spasswolf@web.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712121800.3049-2-spasswolf@web.de>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0405.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::18) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|DS0PR10MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b2d3a4-b376-43d8-5d44-08dca288a062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8sonmBi+x2sLnopzvaBVobejbC4YrSksP0bbJZpG61/GYcC0sQnt2WipyU1X?=
 =?us-ascii?Q?T/x9BUEx/vDPn6689Mabhw2xSKNYELc+98Sah1S/nO+E8NXotXLPDV0plPZj?=
 =?us-ascii?Q?mGAo6yc+EsH5Nr066dnd4qEcCuMhqfUtgNlP7NCpfcpVWXLhuc0qn/7IFh+e?=
 =?us-ascii?Q?kkwgZHMfv5OiyGrxw6tlqYng1v/NSo/4q5CPc5C6vCCnHagOc6oE0ULXDA8F?=
 =?us-ascii?Q?79BjbinyrityZowwUsUOXX9Nn4qUDUohfP2KrpYIUnIdsDKATNm/vPOB2tgo?=
 =?us-ascii?Q?Pe3x3AFZy5X7Mb7FhnQDx/g6Qj/lEZehMplZkyCaDuj6zZSddkVT+/G0i+Ob?=
 =?us-ascii?Q?IidpHAdeqEzcdIUdXyGRsp7Re1QJRVuCdgi2ln07HYsi4UYQu04wDnySeVK2?=
 =?us-ascii?Q?WijOH8PUGzijSjBt8g+36AmZiHksRdHG6o8eqUuIzxzRLbmGpMiX20+D6G+h?=
 =?us-ascii?Q?9L4DEngGpYQpvMgQtpi2nXLlxbZ/4pgFjCv8Wy13zaLZZKW+F9uuUzOYS04j?=
 =?us-ascii?Q?GFeqy+eOTtaBaZaYJ4doBW8fl2WaCT2koFyOJiVutvW6TvxSFLt+DNCMe12p?=
 =?us-ascii?Q?/9tQqdMcnYBCRjb3mcFy6EmVNk6IKU2BMZ/+h1oLi7c0vRgwjwPJnyRR49Ri?=
 =?us-ascii?Q?zQKVr26bg1bjHAFtdtJ5QQ1HCYhjCh9zJmvZk0K6kykX9JHQeICx637NI9Ic?=
 =?us-ascii?Q?DXgNX/kH9YVU8zkfDA7CQIuf0zwd+Lof63gH6Pid98SffoKeEHr5yihD7rwE?=
 =?us-ascii?Q?rhQkBC0a59KY64glxsgLpHPInnrwmaHtjWsWrnokmezgZX9ONG/xjUmiIZfW?=
 =?us-ascii?Q?Nf+wEjdsmYYjzYvhe7B1uPnAB0dAPNo8insxtxampigEhSkWjP7fFuU6sPru?=
 =?us-ascii?Q?pVaJoW8TIcvmtKCMwedfKieXbjoshaPegn3PAIhBOQVefwdp2waWeiJbQ2Ao?=
 =?us-ascii?Q?JH/X7nbzorxO1zHqhY0ZFhAPMdxCFIhiRvCdhWuSxmlk5OhRUoIGrlyy6h3s?=
 =?us-ascii?Q?mS3mwhpzG7ZXl/XTd60lDiVPivAhEv+di8JnpGWxtCWf8y2HRKk0vetarmPi?=
 =?us-ascii?Q?je207qSnvAfx2lFpM0TkF/si5dgHpR/pkXUvTH1F8nCwZphVWsIlZxCiWp25?=
 =?us-ascii?Q?3R168YXy3iY/FggwNgpc9+nkNiOFCJQKaT60Q5AEekVhmsIv+ihktdLpist1?=
 =?us-ascii?Q?DO8019fVChfWGqn5ORsHnkUr0XWI9NmPXe7L7JJLQhvT+IszdQ+Th/joUlfA?=
 =?us-ascii?Q?hG95joYXQqiGahcLN8Fl+AugD/YsmQrzCxg/PXQ8OFgoCois2zPLk+2wp6ab?=
 =?us-ascii?Q?tdHHiZYOBV0TAt1ZZ3gxwA7AgtDa7lHTfcn0oBl2+SfNkQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jQagIB4s0SpDaTIWKbqNT0kw7x2vHm/Atceab6v5IvMNGN5G467FmNF7JS5E?=
 =?us-ascii?Q?HyedCARFjH48bhDt+eXiDdBgODWVFEKyoq0CAU4PKJzKNuRQk8ZByCOQ5nu+?=
 =?us-ascii?Q?prWNKLXdAuhDAVgyaaljTo7cnJqcA8yS/k23cRTQvVmcBOTifJfOBAj+H78d?=
 =?us-ascii?Q?8yavM6yVh0BbExEXP6tTt4zNo6WbDvkCYblTFaIlo2AjPXrV7oeqzhrshFWs?=
 =?us-ascii?Q?+kjVyd7pmPf6b1TJ1GrPDW4UjFrj9Ub+3k36wwc5XYAYIfH1Wl43zfhoNOm9?=
 =?us-ascii?Q?ulRG+Dts4p/VcLrk5kGRGkakJP8EJWtMs8/bBnk3rYjGmaIuxFfTEOKCylL5?=
 =?us-ascii?Q?OXU9OrsKt+AaXYiYoMDyx6kxFn9lDz5FHcDd2voFAe3VepzjGsE8CjQauwga?=
 =?us-ascii?Q?pkfub4bfThC0noxqxTDP0CEiJnQFdwnqUftSRKyuG1MZKGdVE907qAcTCwc0?=
 =?us-ascii?Q?3DU3bSfKseeewpKdrjMHeZZ/oRh1kFPdgJ6+2F4RSah2/jJ7CpPyv8G4QZWM?=
 =?us-ascii?Q?//93WfU2f84wHzf1Y0X95oMPLAsMiuezOqoQcx0PnQjl0rtG/0aIwe9jkcRA?=
 =?us-ascii?Q?VBG1gyugKJ3bRHGpO1f3EqidF4kfAG40u59QN938ehRES2+kboWkLhnPwSGC?=
 =?us-ascii?Q?7cHob8KxVB6tdbVlkvWLjNPWGgVjuMQOG9AqSDBeFdHGv00tI9S9pnHrX8gy?=
 =?us-ascii?Q?orm7/2lBAT/o3TGOYPhpq3j3CEXsKb7Q7LEKlHg8/I6ch+23arUZWEbsSVyO?=
 =?us-ascii?Q?PN3XOE94fSEoqBwHh2+E8RkVH7x2cB7lBuBBddG+qg4KJBLLarKd0owoBKb/?=
 =?us-ascii?Q?U0K7EiIem0/CO25ofUq7vEdJg42YDYpe88kslxfupsWVAiWtyZg3asq1Tvae?=
 =?us-ascii?Q?/v+RT0eoFkTJh1l3mLH2i7cPNLhnRPqt7+BvYm+FfM+tVmwTyj/diSVfgIpr?=
 =?us-ascii?Q?s3kIJW3jiAE40Viv8BrhfK9UlgJ1mpQvxp4+PyR/RCus7p8YQ94Y5M6iDJ1z?=
 =?us-ascii?Q?lB44cXqkoe1n1BYRjKaXEF0veDejbKwboCVa9UfzlcpYBDG+5WaWzFlG6AP7?=
 =?us-ascii?Q?8toyRpC6w6t4SfDNNyYqCN8C7lwvCu9HziFObG+QeMXgadfQUz6lPnObdGAS?=
 =?us-ascii?Q?7oEIknSGDitsh7d7xUyO3g1Zn1G2K/oozzrTJArkc/+7/OTJWkAih3483ESR?=
 =?us-ascii?Q?lujf5VaYo5U1nbEID74V+vOewy1JHLnA6U/EhG6MQ/ovY4+fzsbViedRit3A?=
 =?us-ascii?Q?QHiqvY/Mxo7xt9JGOyMc6G730taJHVF+ruQomhktNtdYAedcuF/6n5c8zz2T?=
 =?us-ascii?Q?hm0KzZsFNSj0YkqSEZCCSCZ7pS1QjB9escRVAQ3rPkD87vAXzeKpxsklTav2?=
 =?us-ascii?Q?xiDXS73wsoqeESV3SzBeCxQG7hMpjx4hRyeDYWifarhyjlLuktb52u6yIQ3R?=
 =?us-ascii?Q?PS0TH0dTVYLj32bVZCIQ+YxVXwE4fKCqqpJNUE1VkX59ycxSyzzT/A5/bf27?=
 =?us-ascii?Q?I7e/fCEZfRpQB/im7WLG/AcLi7flbn+7qMSov2mgVsvmtux4tLqhfJFGfGCq?=
 =?us-ascii?Q?eJ1f/avYCY2+y9P6MBge077JyZpujoi0xeFQ6HlH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	E4K+88LpNpEthcQu6B8XI/a8/y1N/0qwHtfa22htoQW5+h6a3+a/O/lQnuiW3UfsGdpWyMtKTyNFkrbYZ8zquTWehb8NRi1ELrzV4tl/LMm7h3/Dpsg28lFyonNuz233v3vuZGQKXj/Wz/79VAt+RRAVBSoRZy1paA54wZs3iv1iz++SENHqftnMVb/wg5P6edgVF+oSFM5LV7qm6SAQJFfA3+1n76bKoukx1KysaNHaGhi+4totoiaSlTPl+5MWs5TnlyGc1NYgezDkM1z3b5O/PGX2XzjGaVlFyJhaqeBnRc09bEkUSPEFyAJr61+yjwtVwPslqMpDjT/yKisklD/N1zGf4vh/+BaDO7ywB+50B7DVsFFvbOjeP8S8jLOhmkcRtCYIxfMa88J2non8Yy7v5ZUtbIZwe9Rg4IKTS9K7Uxjg4V9/mJuWJfBf0ZOVNt92pI3GpSMEbWU/oKotH0l+VC5XKqmh9onZZ5XlfFl0r52uEPjYQOd69Mp6QKqFCDBaip+8lEIEMgx9gnVOQQYXaocdb5Y1KoDHEHM8lK5JMJouQlMSvhQ+mAs9gh+lOxe50HBld+8sCvdQlsgZp1tC8JAUUqSEabpvMQDP2zg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b2d3a4-b376-43d8-5d44-08dca288a062
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 15:38:07.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR/4RLJpwmwPiKzypV7t2nNqXpuSPedv99XvAPyb3NgwCV3cbZiYbAI43yo9bwko5+EUbWO8BRYj+vLegCLPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_11,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=909
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407120106
X-Proofpoint-GUID: 7cfnjKLrm5pgvsKm-qylvI2_Fe9oJHxQ
X-Proofpoint-ORIG-GUID: 7cfnjKLrm5pgvsKm-qylvI2_Fe9oJHxQ

* Bert Karwatzki <spasswolf@web.de> [240712 08:18]:
> I did some experiments on the rss counter bug. The next patch is made for linux-next-20240613
> with commit 1c29a32ce65f4cd0f1c0f9 reverted. Then I simply inlined the code of do_vmi_unmap()
> and do_vmi_align_munmap() into mmap_region(). This version of the code works fine and does not
> show the rss counter bug.

Are you still working with v1 of this patch set?

I root-caused the rss counter issue and seg fault to the fact that next
or prev may be expanded and I was using the new start/end on munmap() in
the completion.  This was fixed in subsequent patches.

I've sent v4 recently, but will have to a v5 to back off the removal of
arch_unmap() for PPC.

...

Thanks,
Liam

