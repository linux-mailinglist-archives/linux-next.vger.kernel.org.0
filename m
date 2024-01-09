Return-Path: <linux-next+bounces-695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09180828973
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 16:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76882881E5
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 15:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D556D3A1B9;
	Tue,  9 Jan 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UI7usn8Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ISgBLd4C"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50173A1AF
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409FdT4g021124;
	Tue, 9 Jan 2024 15:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=Nj1ZTwVXBB9qe95QpRaO8LNHxSK8EFB39lE3Dilm2Ug=;
 b=UI7usn8QZvIy+ruysn1vx2SeGQdi9BWB5g8yRHCd1j21OA3fWsHB1E8iAmu2QDKcc+Pd
 V8+Ex0+ypxqwKkkeq4QFe/KEJddaqvUq71xl+Zg52rk/4EiZueYsQsOMLkZZSFWYp4zC
 YT2uhEPzkGWFy6CG7TuUr6uV7T0MCLipoUhxzN08fCSHKCCXQgHhzT0Y8ZWPwLsteZGq
 Je41UaHCCVgn20VKjboykuDEwRtnN5Iaarx/X7rpBlNd767Bb6CgrzE4DYxEcE32VvuE
 jJQeQT0p6yqJ0UcCTLjVRJ46t0wAue4CMyWeO5VkvHlWsdeb6LVeyMHK40dk/regn4FG 7w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vh88mr5v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 09 Jan 2024 15:51:33 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 409FUwCl006682;
	Tue, 9 Jan 2024 15:51:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur3xj82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 09 Jan 2024 15:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEKW+eu6dnCM+ViC1/wkRCDIp9TX2E0+M/adVfXCaeqRtoFYXE2wTCppDzJUW1RIbfWsYjWndYOPgvoBZZb6Lt7oNyqizzAx7E1WxvpLGXwz0XWdDSjJdZbe4xQdnejjSChD5WOYfl/1U+sAAL5aJFSst/K7ihqivKPj0xtN2ReREGZhahwikvek4VmG5hHU6BdnA/kh90hEVnKAGS7BopTgltHZviYEtH/I/rod39mRaj1ylWiQLgRW8PSfMCjXbkFtwMHCpmODyqvOTU9lc2bsnyjgwa+edY+II4dYO+I2i1BtXEOh6L4f2D91o3JGR8nKDAFUZM5/PgBKzL8VWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nj1ZTwVXBB9qe95QpRaO8LNHxSK8EFB39lE3Dilm2Ug=;
 b=CueGXT6/Z56MBdupO4o9h3KhYN7T37xFX7amqLQ/HrH3kNb0QR1mJC3y7YD285qHtLwLT3jk/jabVazAo7kPJlGSUMNIAPyCvmJzsQEv8OCvwWPmunr82ssb3P44+GVsbwofe8lP3jHGzVl5yEm0aLh8QXsOsXWlpoWo0kmmAmSMXqn/tsqw2ycxQPlpjbc/V9+xQwSnmecwbfAnwJWGjWnNAakgVxdS0xrNj5w84RhVFkaQF8nRWO1WZffFboKUmOcG9BsHcFjgSy6pjJ/NglVtUqsH1ibaiEyAjvvpxtZnZ0NRq9jZMlQ46a+vw7DMOCb4gcsK5PGaYSHIHBmM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj1ZTwVXBB9qe95QpRaO8LNHxSK8EFB39lE3Dilm2Ug=;
 b=ISgBLd4CzdKtb+NojOZLkwJxmOF6rQgwCWw0cY4ZflDI/wHuYtycpTvY+Me4c2my+2TQarCl1DS3IAlfd670HKabwA27lFcX12fwqI40nvrUJtZq66RCdo+JzQS66fE/1WdLKfPL2YBnwV99JiyC9JTbErTuHtLEQ4s5xrjJZYE=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by SA2PR10MB4635.namprd10.prod.outlook.com (2603:10b6:806:fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 9 Jan
 2024 15:51:29 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::20c8:7efa:f9a8:7606]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::20c8:7efa:f9a8:7606%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:51:29 +0000
Date: Tue, 9 Jan 2024 10:51:27 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: andreyknvl@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        kasan-dev@googlegroups.com
Subject: Re: [BUG] KASAN "INFO: trying to register non-static key"
Message-ID: <20240109155127.54gsm6r67brdev4l@revolver>
References: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::10) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|SA2PR10MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: dd638705-e391-4719-645d-08dc112ad845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YFQVninMqwseA2l+3TB8WmZkhEEnNQn8V/NjOGaYkn50vsBZ0dOSJSgzVVhAGfMuTddWxRcLvJDLoQblgnERYj02agvpzYZ/Yp+jIgMOEa3Z+gGRgusT8wNrVZQ2HGStLB0VG7y9ADfh7viDdNBIN0rH4s0UOd+DWxivVU0Qs3IQ1N39HLlTPVWXPnzIk2xYbjlyoWpv664PepNUoIAAFgTUrNHZFwNXRlJ737gLY6+6hvDMI0O1RsJZq71iGjszWhdPao+oGoOX4Xso+7nLO9ay4KNyMtapBsAobEBqHojLZQV/nh0gcSt+/tewaPoLkbuq3EmP7tCvXpkmWFjtUQ+VaJiL6ec5G5frR4gK8RVclEVkozEvOX+U4P/WtsbiNTuZsJ2yendbdkUZ8lO1ubdRFlckNYjxeSbvYpZYSLOOy0ygbbCaC2ZwyzLXZFhVgag3Je4S35g+syaQqUWVzghe9tA3mtNII10uDl/jGD1JnhiETkuipoNI52RlS0bPb8BHmyNHvhzIDtJzFRc+SWa5xIxh7AiT3d8EsIwmyMKuyyB3zb6uyaBHOolNJHN/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2906002)(478600001)(5660300002)(4326008)(41300700001)(8936002)(66556008)(316002)(66946007)(66476007)(6916009)(6486002)(6512007)(9686003)(6506007)(8676002)(33716001)(86362001)(1076003)(26005)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GZTXhx5u07aYU3rXD73ir69om88Jbwc3A6xn5X6ztH3mUhSURMn33Ppbworr?=
 =?us-ascii?Q?Dm0z66e3bWTmSV4dJvYnaozkccXUVcX109bNEKDZPvTHobIsTKWoIC6npV6z?=
 =?us-ascii?Q?3ScirnBaNdIyqGZ26m/krBE4HICDEcTLFL2ErhvKAYPjeiVCbVCJLKRxYaVy?=
 =?us-ascii?Q?leug2A2H1wgzkPPAULugVhiywEc+DJ0R/pQGauwPluqcXVQ07a+itQkkVXFg?=
 =?us-ascii?Q?rGmVjTbCV9RTN1I3GhwqTmxShcI+bSgM+Oln0qYNXfpW0RXExvCDBsCJFMh1?=
 =?us-ascii?Q?gKAupNEYstxkLZeInbY7doXHZtEevc8RoAHtxtY3Hf1eHd6wtG5BF3b9z2Tp?=
 =?us-ascii?Q?tGn+pLNRmc2hfaeHQM/uvqKcG9KyuexWSaeInJYMFWbWXC+9T8hrPbiJevOE?=
 =?us-ascii?Q?85ZF/u4GL37QUTVGLkncJbzciWK/IXH5AgmABBu4YLehSVfhnm+cUz/lQbmO?=
 =?us-ascii?Q?67c7YOMT98NvUGNEkC4H2/3ZgiS2kbGiJaYNy1CfSUmu+cmii0R1xmY0nQ1m?=
 =?us-ascii?Q?iU6QSueSEsDPkIlzLtiRcsEZ9GDNElmsH3C388XDNHkTuoPWJEGJQkK2Nuz3?=
 =?us-ascii?Q?gdeQtgu2d0lGvUJls6cJzmLjKelJiJAyuH7U5O5qmOU6bEHFpQocrlFcNiYg?=
 =?us-ascii?Q?jp92OK7t7UDZZZTO2nfJutteUbz+4S+qJKQAvkWWDYIvFflRHncfpr+fOz5b?=
 =?us-ascii?Q?J21Iq4bF1FrPHk3Q7RzGSDqzQTmgWd+sCZPF32l8iz33MfLwf24gqW2SOLz3?=
 =?us-ascii?Q?v4ZobUqviUL8MPy0N0bxceSRpArlp1EaleWecqDYc99KaYPPRoYpV+//HRm+?=
 =?us-ascii?Q?XYJT70ll5TX6pWDUg0JuG4fgkzFJiTd80oVpzmJBYJTWrzGUwLv2xKCqwkSc?=
 =?us-ascii?Q?HEvNwO/G9z/6zS9JtQptaX/b7W5pkmPnyXkTZ/KmmTU8bZpb3s3a2l90lEMJ?=
 =?us-ascii?Q?O+qeijYCcfuqcSY2mZkXkctD3Ah2M4MTZ0ZNSgPsoEtOGwUoIM2epaQvQ3Op?=
 =?us-ascii?Q?QQh03BeQ02K11d94slwRFLRgcGRRKe5wCiuNno+J4JtRzkq7sM2ZLoOuXznO?=
 =?us-ascii?Q?a0TpVhYovhDF3FwICa/sgl/gOFnYfPOeWl/9iEyRoTZU0Va8DzkB27ZwB4K7?=
 =?us-ascii?Q?MtlRATRPgV1BZAAfg+cNB/iDEerSnYpsY3SFySkWwBv0vUIQ1lzwQdlhPqzd?=
 =?us-ascii?Q?qz24yI9nZqDQ1cTXLP2aRG2mI96+u6fz8Xqoumd9ODMUnyKMDrNT51CFwIT7?=
 =?us-ascii?Q?xzimFZof8pHciy9QkkMQo/gXy0XmJyZDRbSXgprrjQTv0BsqorDk+8YWcXbv?=
 =?us-ascii?Q?yw+yf+nLJaLofNW6HZyeKDNUiCdDsXOjxUr8OTZJzBZ4pvOavWBKNPRe4/BT?=
 =?us-ascii?Q?CNRQJA95+guX71jkC2EpfsD2ppXGgvWfeHCYlRN7uJ46gm37EI2LXGIGM9Fp?=
 =?us-ascii?Q?1Rx8V2PhlPLiCYuqHKlF2rsCEzFuOtAzPtBbbxaScLBEiReG8FWJdks3HN/7?=
 =?us-ascii?Q?/1Hf1hh4dSoeknfRx9Pxe4foTiBIx04lPdFDVJRTw78URc8Z1fMWvWl5Mfbi?=
 =?us-ascii?Q?JRmySF4Ng8cZxhFLktaHYqif8uvtucRr57KOXTRjMmvnQlgHxAIYHeUb9bVL?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2TMyDLk5OXgvICD63NlqZxN1JscnI0zyoSkTyyHoY9nUHzD1IPRPtP6O8iPriO+azGpRE4aDapHc/lc8nmMLKhroXEWcvfKODdqZbtv7VOHFIdc3YBuk69KrhOzi6tom+kSBqt1IBChqyi2uiibBpbqu4t91NWAVzNx9ZBNpyjmHcA9vlk4CKtLplg10HP4jPjSWH2kD1EXQlaBjTLXSPUyoFELWzwpeN6w19FsPVfOg7QrGVaktzbDNVPOqsAIbDsoX9YIcVWB9s1MyVoCz/AFRZKdahLBBkSKJTG1WZOE5fEDI5I/ExkPz/lthM6KfXMcFrF0vZMsya3ZOSkymFUkJ9xUVS0VD2x7wSzabQ0mwxNh+T9QGRD+E3kCpX1slYKjJKdYF8bjlvqz1stQGize/dOYMaPwTfjDJPsdxP8OHMNf8JoHiQMevY15JZeJJ5xtY1iPAM3c4+uYzyL3RgN4+Nigc2CVx5MVQdWciG2bNlGiIwl3wMokyIaZt1nDaFJAJ/sN/8zktrg/Tsrtw/C6jSrKjo7woSaZ/lDnenpYV9jkrmCRBk35pPY594BJq8e+cAYj5fducCcbfcUbCptBtHmVgyIBNmNJURFrtgA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd638705-e391-4719-645d-08dc112ad845
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:51:29.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbFMESvylMp604EcF9jakB6u3YoxZBGxiefllCR1FY/8WDHMaqTs69V1lU8742kPHOnrEeKA75UhkFemNYbpmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_07,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=892 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401090128
X-Proofpoint-ORIG-GUID: JKE4-eYtp_HEWzigFDJB6PjRckqs6QCm
X-Proofpoint-GUID: JKE4-eYtp_HEWzigFDJB6PjRckqs6QCm

* Paul E. McKenney <paulmck@kernel.org> [240109 09:04]:
> Hello!
> 
> I get the splat shown below when running rcutorture on next-20240108
> (and some less-recent -next versions) on scenarios that run KASAN and
> that also enable CONFIG_DEBUG_LOCK_ALLOC=y.  I am running gcc 8.5.0.
> 
> Bisection fingers this commit:
> 
> a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack calls")
> 
> This commit does not appear to be trying to change the annotation
> required of KASAN users, so I suspect that the commit is at fault.  I am
> including Liam in case Maple Tree is the bad guy, and should call_rcu()
> need adjustment, here I am.  ;-)
> 
> Thoughts?


I think this is ma_free_rcu() registering mt_free_rcu() in
lib/maple_tree.c.

The commit you point to saves and restores the irq state in
__kasan_record_aux_stack(), but the trace below shows it is called prior
to irqs being initialized.  This isn't what lockdep is yelling about, so
what am I missing?  Maybe it will be caught after this issue is
resolved?

I am also guessing maple tree shows up in the stack trace because it is
the very first rcu user at boot (just like the rcutiny issue last time).
I'm just keeping everyone honest/angry.

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> [    0.174878] INFO: trying to register non-static key.
> [    0.174879] The code is fine but needs lockdep annotation, or maybe
> [    0.174880] you didn't initialize this object before use?
> [    0.174881] turning off the locking correctness validator.
> [    0.174884] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc4-00331-ga414d4286f34 #39616
> [    0.174888] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> [    0.174891] Call Trace:
> [    0.174892]  <TASK>
> [    0.174895]  dump_stack_lvl+0x36/0x50
> [    0.174903]  register_lock_class+0x1240/0x1880
> [    0.174910]  ? kasan_save_stack+0x2e/0x40
> [    0.174916]  ? kasan_save_stack+0x20/0x40
> [    0.174919]  ? __kasan_record_aux_stack+0x91/0xe0
> [    0.174923]  ? __call_rcu_common.constprop.84+0x99/0x740
> [    0.174927]  ? mas_wr_node_store+0x8c6/0x1700
> [    0.174931]  ? mas_wr_modify+0x274/0x2500
> [    0.174934]  ? mas_wr_store_entry+0x3fa/0x1830
> [    0.174938]  ? mas_store_gfp+0xaa/0x140
> [    0.174941]  ? __pfx_register_lock_class+0x10/0x10
> [    0.174945]  ? x86_64_start_reservations+0x18/0x30
> [    0.174952]  ? x86_64_start_kernel+0x91/0xa0
> [    0.174956]  ? secondary_startup_64_no_verify+0x178/0x17b
> [    0.174961]  ? __pfx_lock_release+0x10/0x10
> [    0.174965]  ? do_raw_spin_lock+0x125/0x290
> [    0.174968]  ? __pfx_do_raw_spin_lock+0x10/0x10
> [    0.174971]  __lock_acquire.isra.27+0x81/0x10d0
> [    0.174976]  ? _raw_spin_unlock_irqrestore+0x22/0x50
> [    0.174982]  ? debug_object_active_state+0x2e7/0x430
> [    0.174988]  lock_acquire+0x11e/0x280
> [    0.174992]  ? __kasan_record_aux_stack+0xa1/0xe0
> [    0.174996]  _raw_spin_lock_irqsave+0x2f/0x50
> [    0.175000]  ? __kasan_record_aux_stack+0xa1/0xe0
> [    0.175003]  __kasan_record_aux_stack+0xa1/0xe0
> [    0.175006]  ? __pfx_mt_free_rcu+0x10/0x10
> [    0.175009]  __call_rcu_common.constprop.84+0x99/0x740
> [    0.175012]  ? mas_alloc_nodes+0x3e7/0x750
> [    0.175015]  ? mas_pop_node+0x192/0x290
> [    0.175018]  mas_wr_node_store+0x8c6/0x1700
> [    0.175022]  ? __free_zapped_classes+0x2af/0x2f0
> [    0.175026]  ? lock_release+0x1e3/0x660
> [    0.175030]  ? __pfx_mas_wr_node_store+0x10/0x10
> [    0.175033]  ? __pfx_lock_release+0x10/0x10
> [    0.175038]  ? lock_acquire+0x11e/0x280
> [    0.175042]  ? stack_depot_save_flags+0x148/0x650
> [    0.175047]  ? find_held_lock+0x33/0x1c0
> [    0.175051]  ? lock_release+0x1e3/0x660
> [    0.175054]  ? pcpu_alloc+0x81d/0xa30
> [    0.175059]  ? stack_depot_save_flags+0x1da/0x650
> [    0.175062]  ? __pfx_lock_release+0x10/0x10
> [    0.175066]  ? register_lock_class+0xc9/0x1880
> [    0.175070]  ? pcpu_alloc+0x60e/0xa30
> [    0.175074]  mas_wr_modify+0x274/0x2500
> [    0.175078]  ? __mutex_unlock_slowpath+0x176/0x660
> [    0.175083]  mas_wr_store_entry+0x3fa/0x1830
> [    0.175088]  mas_store_gfp+0xaa/0x140
> [    0.175092]  ? __pfx_mas_store_gfp+0x10/0x10
> [    0.175097]  ? lockdep_init_map_type+0x2c8/0x7a0
> [    0.175101]  irq_insert_desc+0xaf/0x100
> [    0.175107]  ? __pfx_irq_insert_desc+0x10/0x10
> [    0.175110]  ? kobject_init+0x68/0x1e0
> [    0.175115]  ? kmem_cache_create_usercopy+0xce/0x240
> [    0.175119]  early_irq_init+0x10f/0x140

IRQs are not enabled at this point.

> [    0.175125]  start_kernel+0x177/0x3a0
> [    0.175129]  x86_64_start_reservations+0x18/0x30
> [    0.175133]  x86_64_start_kernel+0x91/0xa0
> [    0.175138]  secondary_startup_64_no_verify+0x178/0x17b
> [    0.175143]  </TASK>
> 

