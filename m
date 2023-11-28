Return-Path: <linux-next+bounces-105-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7C7FC7C2
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 22:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F1C1C21144
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 21:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE60A44379;
	Tue, 28 Nov 2023 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="KD5go6n4"
X-Original-To: linux-next@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533897A97
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 13:11:38 -0800 (PST)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id 84carKZgKhqFd85MnroRGL; Tue, 28 Nov 2023 21:11:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 85Mnrds7O0xkr85Mnr8TGU; Tue, 28 Nov 2023 21:11:37 +0000
X-Authority-Analysis: v=2.4 cv=N7U6qkxB c=1 sm=1 tr=0 ts=65665789
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=7m0pAUNwt3ppyxJkgzeoew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=zd2uoN0lAAAA:8
 a=9zuar6N38og71xDKz2QA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TiP/2V3RC/zKLbrrfqT8GJnX8XnNxPZk+5RBTrP/V9g=; b=KD5go6n4Le1krDwyf5jeGC8zSu
	Qw/3YLFf/p+C22i+MOSJLnd9nze0xXzvlA1S5uBXbKaXJD1RE3MIpGxnINEKteLY3csjClrNIc0Vz
	O5yUWRfxEgqomVRie2QZtb9tsCI00dI+/qqYlss5aa/ECT8XBHASTE6kcgXk+6eZwpvekCcYwOZtX
	FctGxBVNIT58kNyOlP+wx/p74CrhNrEWbzFSY4DNUXG8kgfCfOKOZJJ5fpecBzXX7Prr6+5Yu3NZ2
	l5/y0OjF7qrRxidQQGauBPvcICw2YtuyA2dVL7eTQzNFUHx39oWkMAnESjVMvJKEj5QuRKY+NCc49
	qb6w6SeA==;
Received: from 187.184.156.122.cable.dyn.cableonline.com.mx ([187.184.156.122]:31312 helo=[192.168.0.9])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r85Mm-003FhB-2a;
	Tue, 28 Nov 2023 15:11:36 -0600
Message-ID: <001021e0-2262-49c8-89d0-c0d0720ca313@embeddedor.com>
Date: Tue, 28 Nov 2023 15:11:35 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Aithal, Srikanth" <sraithal@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122144814.649823ac@canb.auug.org.au>
 <813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
 <20231128091351.2bfb38dd@canb.auug.org.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231128091351.2bfb38dd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.156.122
X-Source-L: No
X-Exim-ID: 1r85Mm-003FhB-2a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.156.122.cable.dyn.cableonline.com.mx ([192.168.0.9]) [187.184.156.122]:31312
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfARC5qRqYBkQK8gHjuNudorqHFoooDI7XzrLtdfskU6zqcN+et2XizfLg73DNsC/jw1dyyUBakb/9uQHMYhlxeCBJ/xjl9kwnYbqXwu2B1+NnqPS8jAq
 2ooIGl5WrXQP8DwFBgdj9SiPz41kxnte0m9KCGEm8XKnOZ9/iHpaBHgHELcAGtqCscn5nmH8+rR/94lf+ebYu77c2SlfGyleJ0Lb3XNvUpVu2g/f2DmnPJ7t

Hi Stephen,

On 11/27/23 16:13, Stephen Rothwell wrote:
> Hi Gustavo,
> 
> On Wed, 22 Nov 2023 10:21:27 +0530 "Aithal, Srikanth" <sraithal@amd.com> wrote:
>>
>> @Gustavo I see you have mentioned it as gcc issue. I was not hitting this until yesterdays linux-next build. I am on latest gcc which RHEL 9.x provides,
>> gcc --version
>> gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2)
> 
> Given that gcc 11 is a provided compiler on RHEL 9, can you not add
> -Wstringop-overflow for that compiler, please.


Sure thing. Working on that. :)

--
Gustavo


