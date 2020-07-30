Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A372329BE
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 03:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgG3B54 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 21:57:56 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:52059 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG3B54 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 21:57:56 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 9A73F200E1
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 01:57:53 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 6C4AA3F1CF;
        Thu, 30 Jul 2020 03:57:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 38F7A2A905;
        Thu, 30 Jul 2020 03:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596074270;
        bh=HNTEtPvZ8Q8gpHfiRmmFzp9wJg7FvAMRKSwxXCTdJrE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BwbeTpv5nImr8tezlb1vzB2mbeke4/G4RVKozUmwkrFbDdrHv9rckNjRDOiSBACRu
         RHzZIHM4PJXBDq/M6jfHsPT8A0AhhkwndzNRvC7BAk82ptan1Zr98IXVGTIwBeQnQi
         5/EOXz/gR43aXrFxcyzkx5xRmNdb4JbO11aCMR0Y=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dkVGCNmU6JUo; Thu, 30 Jul 2020 03:57:48 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 30 Jul 2020 03:57:48 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id A46B940143;
        Thu, 30 Jul 2020 01:57:45 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="YWQi6BdG";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (n11212042148.netvigator.com [112.120.42.148])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 74A0C40EB8;
        Thu, 30 Jul 2020 01:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596074226;
        bh=HNTEtPvZ8Q8gpHfiRmmFzp9wJg7FvAMRKSwxXCTdJrE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YWQi6BdG/NkMEerlQ1guyowekdGQEQKRmswhMgIQKX8MUnnQc530Sus0VGPVC5aSf
         cbR7Lr9h+zV0v+be1jTdNq0Vjmoj34IZKBgz34SCAROeB7mA8PzHIJHy5QmH9HjkEn
         RfCFYxbSWWbM77QQfAulrrnDqOxJa70EtFrF0764=
Subject: Re: linux-next: build warning after merge of the mips tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
References: <20200729203142.18248463@canb.auug.org.au>
 <f2a9f50d-5299-04f8-146b-e09df8943367@flygoat.com>
 <20200730114023.60317d30@canb.auug.org.au>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e8757bd7-e6e6-5181-ef52-7dca0a114360@flygoat.com>
Date:   Thu, 30 Jul 2020 09:56:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730114023.60317d30@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: A46B940143
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCPT_COUNT_SEVEN(0.00)[7];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



在 2020/7/30 上午9:40, Stephen Rothwell 写道:
> Hi Jiaxun,
>
> On Thu, 30 Jul 2020 09:04:40 +0800 Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Btw: Neither James nor Ralf is still active at Linux-MIPS.
> Interesting.  I have just them listed as my contacts for MIPS.  Should
> I change to just Thomes (Thomas Bogendoerfer
> <tsbogend@alpha.franken.de>)?

Yes, Thomas is now the sole maintainer of Linux-MIPS.

Thanks.

- Jiaxun

>
