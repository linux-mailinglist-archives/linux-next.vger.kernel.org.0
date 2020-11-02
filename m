Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56ABD2A30E8
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 18:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgKBRHi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 12:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbgKBRHh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 12:07:37 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A549C061A47
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 09:07:36 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id k21so15622569ioa.9
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 09:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RgzfsRmXFhqBHSdx1zZ8lf3nx1SGdRkGq7oD4cRkyMc=;
        b=GtJ/HfBU+CPqw01bKDnZ2U+zd8bF/riSntMlucKhNZE3SoczRSuXICyc3XW52ZgUc8
         GD/Mfa7SnGorzR/clsnZitFqhY0KsB/U9TCShYxA/IS/vSpBF4jauNLBoOokc+AiTqoa
         juNawangws7wBF9F8sY/Qrh+nWuMdd16GaawLZ/6eXIKwqGohYVCG3CcQp9JxNHKfTCi
         M1F2tEFI/IdCRTVVIremah96R2VqhF4cOCa8/Ma8dV8JQpEx7loaul2HFnt5NIJodWPO
         mqWpJAX0bLXXN4XNPEr5ZyveNAFOWFfFDrxGgoq+wOguhY2xCdpCab932rhn886y5Vap
         /jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RgzfsRmXFhqBHSdx1zZ8lf3nx1SGdRkGq7oD4cRkyMc=;
        b=QOILeYWKaY6KzrPv2YBprc04lGCtoLwXikC/1qPX/YNRZ5DAbjIJS+qZc3AAWfWTj0
         5j9zaP71ccmhx4KsKHn/bQjnw9KeeuNOP/NldfgmaaVui1Qi0XMaOjKjNKgHOA0EcoWP
         M/Z+jBqrVhEe7f+HQChbyRf8o0UP3Y4Uf44PuLzmO7Tf9a2ruq8Zvyacesfx44PPJvlC
         d2Ttk1ohs3dDGJDZWd9QmF8uANMGMvvRWqKui17DYMI0KHCLAJVgnZ5ekdsa0OHuGXqf
         nM6wuRRPoJ0xk/5CSpRqhgsiGpNJdsrd2jWsIxEVe/NN6+35Y5TLZ5ssHCTAHiLQnufg
         ZGvg==
X-Gm-Message-State: AOAM5334wPbK13oIvqZGp4mhzProDz1w/xQR9pPSkusPl1rZRlyodNon
        TjR7wPNDd8/VUINZdGD2yduAldz1nkfCdA==
X-Google-Smtp-Source: ABdhPJxCzhJ2kVZnH/SNlybES85WLNtcHCLpI1yn+HlYU+Py0bPcfOnkGw2Jr4i1CpF8nsgxWhfrIQ==
X-Received: by 2002:a05:6602:164b:: with SMTP id y11mr4370751iow.36.1604336855108;
        Mon, 02 Nov 2020 09:07:35 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id z9sm10731628ilm.21.2020.11.02.09.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 09:07:34 -0800 (PST)
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
To:     Qian Cai <cai@redhat.com>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <20201101173153.GC9375 () osiris>
 <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <54c02fa6-8c8a-667f-af99-e83a1f150586@kernel.dk>
Date:   Mon, 2 Nov 2020 10:07:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/20 9:59 AM, Qian Cai wrote:
> On Sun, 2020-11-01 at 17:31 +0000, Heiko Carstens wrote:
>> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
>>> Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>>
>>> Cc: linux-s390@vger.kernel.org
>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Even though I did confirm that today's linux-next contains this additional patch
> from Heiko below, a z10 guest is still unable to boot. Reverting the whole
> series (reverting only "s390: add support for TIF_NOTIFY_SIGNAL" introduced
> compiling errors) fixed the problem, i.e., git revert --no-edit
> af0dd809f3d3..7b074c15374c [1]

That's odd, it should build fine without that patch. How did it fail for you?

Can you try and add this on top? Looks like I forgot the signal change for
s390, though that shouldn't really cause any issues.


diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
index 9e900a8977bd..a68c3796a1bf 100644
--- a/arch/s390/kernel/signal.c
+++ b/arch/s390/kernel/signal.c
@@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
 	current->thread.system_call =
 		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_NOTIFY_SIGNAL) && get_signal(&ksig)) {
 		/* Whee!  Actually deliver the signal.  */
 		if (current->thread.system_call) {
 			regs->int_code = current->thread.system_call;

-- 
Jens Axboe

