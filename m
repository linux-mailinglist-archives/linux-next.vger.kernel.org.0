Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA0023294D
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 03:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgG3BFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 21:05:32 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:34278 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgG3BFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 21:05:32 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 7E0422636A;
        Thu, 30 Jul 2020 01:05:29 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 321EC3F162;
        Thu, 30 Jul 2020 03:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E021F2A905;
        Thu, 30 Jul 2020 03:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596071127;
        bh=qdsRPhmO+L5hjef8bRPCdPBKjPsHQKVEGVkqtl+9ymo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=xqEW10RONSzyVDklzuoNTQD4U8w52vIfVzSXDLZUny9Vz4hSXK8bC4wnohWf7wy/O
         2C4TP/FNfw5AyBYORaU3t8MPCm+gKp+llC9UOMZbYsKulLduOqb5jCy+E7P+EARk4L
         Qr4+hxBwbRxliG/a6uY4czmkPY89M/nwECKY5eoc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wRMZEMqT6eDq; Thu, 30 Jul 2020 03:05:26 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 30 Jul 2020 03:05:26 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id EBDE440EE0;
        Thu, 30 Jul 2020 01:05:24 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="PE+nHAN4";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (n11212042148.netvigator.com [112.120.42.148])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id CA36740143;
        Thu, 30 Jul 2020 01:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596071089;
        bh=qdsRPhmO+L5hjef8bRPCdPBKjPsHQKVEGVkqtl+9ymo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PE+nHAN4aM3BVNNwKeOBHDkkc7Rl4WvadeBclNiZsydlWZr3Uk7MbvGjuUP7ZYcjK
         4Pq0clTAVxOinQ3qu2l8CX77c3mANCqjRqavnA13aSA7RtrkBGhRMieLnU8UYpq8th
         O40Oyj9l/KWEoItwhx5nHiz9N3Qv79IjIMBCuVyQ=
Subject: Re: linux-next: build warning after merge of the mips tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
References: <20200729203142.18248463@canb.auug.org.au>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f2a9f50d-5299-04f8-146b-e09df8943367@flygoat.com>
Date:   Thu, 30 Jul 2020 09:04:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729203142.18248463@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: EBDE440EE0
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



在 2020/7/29 下午6:31, Stephen Rothwell 写道:
> Hi all,
>
> After merging the mips tree, today's linux-next build (powerpc
> allnoconfig) produced this warning:
>
> drivers/of/address.c:104:21: warning: 'of_bus_pci_get_flags' defined but not used [-Wunused-function]
>    104 | static unsigned int of_bus_pci_get_flags(const __be32 *addr)
>        |                     ^~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>    2f96593ecc37 ("of_address: Add bus type match for pci ranges parser")

Thanks for catching that!
Fix patch sent.

Btw: Neither James nor Ralf is still active at Linux-MIPS.

- Jiaxun

>
