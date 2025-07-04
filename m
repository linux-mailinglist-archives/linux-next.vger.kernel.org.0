Return-Path: <linux-next+bounces-7345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6299AF853C
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 03:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6774A7F0A
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 01:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66EA1C69D;
	Fri,  4 Jul 2025 01:33:41 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5508360;
	Fri,  4 Jul 2025 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592821; cv=none; b=fGlI9qcWcjZgDjMW9JFmQnQWlsrg3J4GUzRrjDjuD2JNXA0tAvScfL+ZuFZLgfHxrHNyka7PmvtayajiBQNaEJvhy/3OKVeUuVi4sEvky8PU17NQTxfmG5xHv3hRdGO4IsRfaKWgd7I2B+H6NgsywFXviQBKXylcV2ogsfbA5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592821; c=relaxed/simple;
	bh=5upm/a1Q1xYZt2oprjiDZ+sMFMN5dlcunyhi/1gzG9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugt3EwpuAv3ZOZBJS5xFBeemSU/Xw85Ya0l3W0hS5mLOFBdcNIoUmrAd2LIW6fFe0j/OmTdPyzVNr4gfN+VWlrW9w71ffJmPqdhhpSwoUE+8PH8dF6gwCznLA7D5YNiSks35XtZvj+WqeVhuYQ+HnZFodRSzCva1Wa6IDydLm+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5640wuvb008777;
	Fri, 4 Jul 2025 01:33:23 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9e81e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 04 Jul 2025 01:33:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 18:32:39 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 18:32:37 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <greg@kroah.com>
CC: <Lizhi.Xu@windriver.com>, <arnd@arndb.de>, <linux-kernel@vger.kernel.org>,
        <linux-next@vger.kernel.org>, <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Fri, 4 Jul 2025 09:32:36 +0800
Message-ID: <20250704013236.703903-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025070323-unpicked-virtuous-07fa@gregkh>
References: <2025070323-unpicked-virtuous-07fa@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QT3oerwKfl2Vx3FvL0psQI25kGaNQqik
X-Proofpoint-GUID: QT3oerwKfl2Vx3FvL0psQI25kGaNQqik
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68672f62 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=RQiUvKhxgLTsCj1AiuoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAxMCBTYWx0ZWRfXxxIYNWbynaem dBz3t2YLFWnjPRHfIilypG7XPcOv4RT0UYK5ePUa8T5M3WofnqkFhkbthVFdJgn7lA7/KYmG392 um+Q+x4OyKQhYUgBCPFnD9RyZfEVIHlM/mu31/GY9wPr2rK9tjCWA+uyZKWbt/ieymQq9GKE83E
 G/JIPncsi+UbftDIzotFpnE7tNHBEUJSa6Zg6KjBxbvmYIPdACLXl3w/NeE7LWbRPnw0M9837k/ aSu8bvUpAmK3/g7DmTMWs5IpU9WMgfb/V5/tZ+lm4pXF76W2q1KkETh6ZxlhGrXNNJYhHI9/JHZ lW4TOQPYPYToEcWvxTzLOaiIVkpnAG8nwHbrCVPLoqeWolJ9aD2NeKwzjoVI9EccUCHUcFnxoT/
 GTlAJ0ZT44XV8yeJDDaHMtmsuAUNWVOUaE9DbYze8sJMWcB1cZ8T7PKrFLOXclgnYcDS1avf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=994 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040010

On Thu, 3 Jul 2025 13:20:47 +0200, Greg KH wrote:
> > Please read the context carefully, and you will understand that this is
> > where everything starts.
> 
> I'm sorry, but I do not understand your quoting style.  Didn't the links
> I provided earlier explain this?
> 
> > In the code before memset, the ev variable only
> > initializes the members of its member hdr.
> 
> What code does that?
    static int ctx_fire_notification(u32 context_id, u32 priv_flags)
...	
   5                 struct vmci_event_ctx ev;
   4
   3                 ev.msg.hdr.dst = vmci_handle_arr_get_entry(subscriber_array, i);
   2                 ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
   1                                                   VMCI_CONTEXT_RESOURCE_ID);
253                  ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
> 
> > Originally, "struct vmci_event_ctx ev = {0};" could be used to solve this
> > problem. After careful analysis, I can clearly see that the data after the
> > ev member hdr is not fully initialized, so memset() is used to set the
> > uninitialized data after the hdr member in ev to 0.
> 
> Again, you have a structure that has 2 structures in it, but no
> guarantees that there will not be any padding between those structures:
> 
> struct vmci_event_ctx {
>         struct vmci_event_msg msg;
>         struct vmci_event_payld_ctx payload;
> };
> 
> Nor do you have any guarantee that those structures don't also have
> holes in them.  How does any of this work?  Is it just luck?  I walked
> things backwards and find it impossible to guess as to any of the fields
> here actually being properly aligned or even using the correct data
> types to cross the user/kernel boundary.
> 
> And then you throw the whole thing on the stack:
> 
> > 248                  struct vmci_event_ctx ev;
1.
struct vmci_event_msg and struct vmci_event_payld_ctx, those struct are
used to contain data for events.
Size of this struct is a multiple of 8 bytes.
So no hole.

2. 
ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
It means:
2.1 ev.msg.hdr.payload_size is sizeof(struct vmci_event_ctx) - sizeof(struct vmci_datagram)
2.2 The size of payload_size is fixed.

3.
Yes, they are on the stack now.
ctx_fire_notification()->
  vmci_datagram_dispatch()->
    dg_dispatch_as_host()->

Before the datagram is queued in dg_dispatch_as_host(), a copy of the
datagram in the stack is made using kmemdup() and then queued.

4.
Before they all enter the queue, they are in the data preparation stage,
the actual event datagram is not really saved, and the size of payload_size
is fixed, so it is clear that except for hdr, setting the payload content
to 0 before initializing other data will not introduce any unknown behavior.
> 
> And attempt to initialize the fields manually.  What could go wrong?
> (hint, syzbot showed what went wrong, and the compiler is now telling
> you how your proposed fix is not correct in the long-run...)

BR,
Lizhi

