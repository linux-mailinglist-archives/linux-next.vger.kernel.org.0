Return-Path: <linux-next+bounces-5697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD1A567AA
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 13:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F2B1743A0
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 12:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0D02192EE;
	Fri,  7 Mar 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Me+fOF2r"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130C218EB8;
	Fri,  7 Mar 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741349773; cv=fail; b=W3c+lXMz13sTDolaf7WcP5y3YdXtwkJpHk3nzMp1D9JtRCUdwI7MQz/l3rupYfzm8Bf2+60JVeAjzRmEhsJb4FCOWvXXRINKxnpkEE9JtQNL5HE49Dr+j36hYcfqWfvTstOTXWXIGPZ9I6x7kPc3JEFaOAFQrlA+iD/a8ZWVAdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741349773; c=relaxed/simple;
	bh=U9j5w3NnYbhNA7k/hYyFtGNY6pIeU6EbWdMM45ZxwTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gNs3k+SNwjnbqkeZq0ThGl7hWHkzao7MG3ntnk5s143m7tuTeluj6ZU2BYLp0J/AeCqOJ8wzQ9bcvuuEr8cIYnUMPSyVyWS0wYWKdsNO6GfuPT8LipoKKsISgOl6hVLSE/gQ585BxQJAHRmpiBnnpI1ucJZSFVV4MCaY0xHZa3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Me+fOF2r; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7pqr8MYXAW983wegBal9UtCL7XvhV4tU70OH+aM1zqAE0rlCbDSPbeM9/AyRSSZTB/MpeJLyMPezGx2139jd+aiJC0WCK3hcZn+rOR1koBIFUjaXcgTvsMNibw5lEg5nwE0ZQn4sRQ8lu+XYKFsBEjXNrFomY4jX6pG2WfRtVTEbktfJVHuCdhH2beEkIy6qRIcvQe/HzTC8zo0X9wsubC6yQ8I6kUxuORUIYSgSfTUqQ1zaMeOk/pIRDUnJH0biq6YWPv9QEjmIOT+Ra88f1oFiR4gPxGXLHk7vw7JXEXFE5nl/pfpDs/slyBTj8xqG6G+NC0Z+Y4OXoLWBMVIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK2hd2iHSzz2oo+OFc5ouGAxFGyAFNWMUeUXzWn0iMQ=;
 b=sGi7MrraVnu47K+gHzZ1+t+A+Wp1wyoS6K8VY7hlGMoGxXx/2RVloqb3cIt+zwisjCvmx/CyyGGhqkq1JlC2Pe6V6w/KOVoUAZBFfqgnMWgXMK8aDi92+Ho9yyW68mshnOoK0LH+zyOwo6kKIiXMyDh8uza5rRE0PJG4HIUiQIpA9RdZ1b2izpgCa1Fnr75yYC0cilqaNAMBANHyZ/aGn7PtJgCgw3oxGjofCMaghfmAqYTDNLi1OLnBrJogWMJKIIsxGypK3UpT1b+apS0G0TxVdckIPLSdrTegfmWEd/q6tN+MgBIR3BHS9oUo9LQzQq1ZD1rXg9Uwo7LLyxw5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK2hd2iHSzz2oo+OFc5ouGAxFGyAFNWMUeUXzWn0iMQ=;
 b=Me+fOF2rYgaRla1nSTwOuXltoDUiipUX6mxal//oHqzr6jLCQgVFwNYOUgYDpeNL/5F3toVxEln+o/zc6RB5YKRTRVDEGtKrFGviZaIw2WY7AntMe+s7WkzzzvnJXSTKxfCwwSZFW3rr3AsoERknY2x8GRQhENF3/z1nACsn0Ftl2+Tj797sdQEMCIzAlqVm5U1heZ1Xn8vPf7k3goxT9uDCstVOveHmCF0ktDZb/zl16qHo+tBepF6OH51AjCK/OZYxFjvav+2dC4shpPiq0Mg6WcxSCnv6idGweAlvZnaIZpNmWcrv2b35zFyk1r2BCDO5+1M3BJ7Z5v0USrxeXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by CH2PR12MB4245.namprd12.prod.outlook.com (2603:10b6:610:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Fri, 7 Mar
 2025 12:16:08 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:16:07 +0000
Date: Fri, 7 Mar 2025 08:16:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cxl tree with the hmm tree
Message-ID: <20250307121606.GJ354511@nvidia.com>
References: <20250307191448.36be9934@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307191448.36be9934@canb.auug.org.au>
X-ClientProxiedBy: BLAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:335::27) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|CH2PR12MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b191ea-5866-4eeb-0e42-08dd5d71d6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eQ7o/c5FCMNWI5s08RQWn9gihAQzZ+IdoHz6yO6dGB+JcuEuYH2+QducSp1r?=
 =?us-ascii?Q?eHlwL+GVppPbD+qlE9HnkTcA1VQ8XjxlwlMWiaUkgcG0ikJTGvUjZxQVPNw6?=
 =?us-ascii?Q?o/WhW97bJpWDxiPgY5OWJ/Sv8hYpi4l7cxtMKl6lQVeoCGNQfFHxJIAvbA0t?=
 =?us-ascii?Q?p/lvYn7EIZrEJ1aXmolc3LPYC9JT2eVU3u+Z/ZJBZVAMsVHE2P/bqirCjWGi?=
 =?us-ascii?Q?fJFTL7rt/4mzNgGQqvCo73ek0TEDEQEkmNYwrhj+380aT0b7OfIDNGItDb2w?=
 =?us-ascii?Q?4s4sqF+sEqXYjnoVxJNTLrkWOWertQQ1AtlFxLC0eyAQdZ3h7ZFZGW4H8/+z?=
 =?us-ascii?Q?biUNi3gk4b0HFv6Toif6vJCOtkotNbDPHWovVos/QdhBAw/pJgqVm4Z3UN/r?=
 =?us-ascii?Q?kyLZ8A/rQUJ9tHArCvbo5z36H5Mel5+lZXcVZFThE2RhcE43S2qPE5WLfeav?=
 =?us-ascii?Q?5NvGRQI5TJitJ6A8szgzRyUU6ePpb5OqhrOPT7cdeCM0FbY+pF9ZSCI9vzGy?=
 =?us-ascii?Q?ffIO+23l3xguHi8pMkZG94DIMYp3R2zKWMcY6RZRkk8FOmB+TZi6EEgf/55S?=
 =?us-ascii?Q?d7kC4Wgf/WWPvHj3l4BCWAmFnbH7/7avlijI+7fXaqDvermbLobAuXAhVUVq?=
 =?us-ascii?Q?4JL4M6SfDFukf9QGnFGIB6TjuQ9JngXQsAy0xnCXsD4KlzRUZW2s3wQfHbfX?=
 =?us-ascii?Q?n256m4DjwrS6ypOrXlDVoh05FLeKMNqXg2snVr5jMKP804UiNe3cONKa2h00?=
 =?us-ascii?Q?f6IeMPSn08bfP93tdHofbleJVZ2IaJbED9cnU75qyHyE0avGAdqcLmxXek6U?=
 =?us-ascii?Q?Hws2N2q1v/AZyTRLgnQyuOpU4LfYwEn0esfYlDyE0uDg0wvJ1EfqbTwg+PwX?=
 =?us-ascii?Q?F46dCI/PGfROhYfwKtGfHsWAmLbSG+0EtYZLya56qLAGwSXm9CjaIHnK+Y82?=
 =?us-ascii?Q?aYonIhBlat0LP7Q5JbqlRQEWGEnopcZ3QbrtpwUa6Hmlhfm0ihUpybkQg4M9?=
 =?us-ascii?Q?VhgKmYSVzy70AI/KOJqGJGvOc/0QNTA6VD+7RPrg6s8agugbkWb+oDRAjomW?=
 =?us-ascii?Q?rMWTf4j7YrNYhy6rh+g+lyahuv6Lk39vH6HFDtSf7QDgLefuiC5cprFjBBo4?=
 =?us-ascii?Q?oNz+uewL7iL0OAAEpw9wcRkT36xnyAG1zU4iZATS5uX7ul0kDmV6DDqgEq5t?=
 =?us-ascii?Q?tV26bfZ7Qlc3/upy1z66xm3zJWFu18A7D5ShtyOBbNNJOx5dm3UNra9OVj0M?=
 =?us-ascii?Q?ttPWMSPgzYalNBeh/biXGD/FpEQuh8bXVsw0d8vG72+yX8CeG+I/gZ1DNYrW?=
 =?us-ascii?Q?RM5fkHveXVNz1T7//GwMqlFoaXyFALPmZHkTAZn0ieeAzC0dxPSZ0WiZELLJ?=
 =?us-ascii?Q?jeWrBMC3RKSwxWi1Fx/JatPe2HUn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?raSYu/fztSOyF4FQJQfSqAtWKufvgRMzhelFBGUMqgyiIBKjuxHziGQJR0ac?=
 =?us-ascii?Q?T5cV3KgyJzgIqhcZMCfFMIUh2W4pc+9qptaFOKitM85jj4NgMgtB5HwYEkWa?=
 =?us-ascii?Q?NkIFetV1SK7bTiiTxYXVuN+cudPILxoniGtfSpLdTTRx9UiIOn8dMw3v4u0t?=
 =?us-ascii?Q?V89cEiYqpaz11saMHWzbvikKCcIVU/OIYKtG1/5oXYPl/EZMps/ts5KBTutR?=
 =?us-ascii?Q?PoJl2CEIb60MH/5hYiX9UdSRf9lrAV7N4PbmjOJcr+4BJttO/6Rxb9ACxKPK?=
 =?us-ascii?Q?I/wD0xdOmOSI3f0gdh3zMD/fUGfbDnlxr5hSQBWTLpMWkQDfv/FHLMo6SiSi?=
 =?us-ascii?Q?1XOWS/Tr9iq9n1qN6I5lAQdSp2vF+iXCpn7WUVY2Jdhn8J8Pc43uGihlFvKf?=
 =?us-ascii?Q?Y0uY7udf2abE5gBC3uYl6LCsBaXSCUZmG9TapxFKGnsu3kQz+e++s2a9da53?=
 =?us-ascii?Q?gsm4l0gu3us3HmUl+/2gdLRKgssyRYxfzEKkrq6lxB0ifv/wGIezJ5CgAycZ?=
 =?us-ascii?Q?EPF2pKLh2RY7vWpr6eiPZLnW3MQgwg6g+XiGnmDCx2hryn1JDAyFM0c61BEq?=
 =?us-ascii?Q?2Lylv+lEwgnwwvGC5+9vq+VCjfglWV3iilS6ejIOZc3fW0a//ajNKmlgyk7D?=
 =?us-ascii?Q?XPE4S6gQjTiDEPPwuDISYXeRfZEDcU51C4ZhqR/uij6hdYCUG5w18/EhnU7+?=
 =?us-ascii?Q?oG6sYCIzlyPrb/m31AJCP+qMhzv9ZmuHxNxhW2hdQ748Y+HuiuWHsPiBIoPQ?=
 =?us-ascii?Q?7o6psfLE5sn5RosfPSKODWAY9oVaiYRaYe8CXESCcYWGNoBn/agf3xb3koVw?=
 =?us-ascii?Q?Upas/4u5bJGdchkWSVehYNTJlaKNt6R1l+85D6luFhcm8S+bRypONfINRVXJ?=
 =?us-ascii?Q?5RljZwfuAMVNYtCymVhejPK7Q2iH3l8QgS3c2+kTnltOosholqZYo0X6z29N?=
 =?us-ascii?Q?/+9UTGPSKyrv3nLpP3oI4qCWrd20Hdz+Cmr5UFQNjPH1+0CbJYzYaq2LrHeD?=
 =?us-ascii?Q?Sy68vIAWWe+OgS8/tlwQwZ77KPGkiUD94x5IZzW6kYZ7zBFVIt3TRBl/19P8?=
 =?us-ascii?Q?eEfwbLfmEej4yJ4Y8BwBIQ5GIyoxLlaPEcK4EJ48UrC5ixfGjKMxQpG6fPHa?=
 =?us-ascii?Q?iSVXIs8+1Nx2F1PMBLNhyOrLDki8haFt67FRYiNy7O0m7jtb06TeXs9z3uza?=
 =?us-ascii?Q?a71EsIpUe1RRi/lsltwdIuU+PfUn+VHqt6U+Yxdf4pmug2HqS4y2r5mEQsxw?=
 =?us-ascii?Q?jCFS/7bJfQpZp1TskDtrQWA68Yd7hXajqn7sBPZUw8aSF3aLyELyhjzIy+Yi?=
 =?us-ascii?Q?YAaJLdpAC6Vp8+hwc92+18LJWt/phrp1/+lJvz0l3N4ORpnzyFdrEq5HnYV9?=
 =?us-ascii?Q?uzHcvh9h0xxIMLfgjLgj0seW1FdzxvVSrHXeUQr1FcV62pWUjeqk1/OXxa3I?=
 =?us-ascii?Q?HJhLBOch3y7g7jc7XNEggweWdd+l4l/Fa78dZuMFpau2ivfGcGpyBu11KbYk?=
 =?us-ascii?Q?fi10NHdyoZ19v6qecQZMYk3vJq24tEPodriPB8+qmBhtu4IGrFV4fdS2lHG2?=
 =?us-ascii?Q?79g79yT3zWCXwZ2M76Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b191ea-5866-4eeb-0e42-08dd5d71d6fb
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 12:16:07.7486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbObYBYy+piWxmCAcXsu21Hmpv33Ztt91499GLw+ONIgXl9QsGc2te7ts+zf4GYB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245

On Fri, Mar 07, 2025 at 07:14:48PM +1100, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, it looks right

Jason

