Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7152D1A3A
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 21:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgLGUFZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 15:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGUFZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 15:05:25 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E893EC061749
        for <linux-next@vger.kernel.org>; Mon,  7 Dec 2020 12:04:38 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id n26so21286796eju.6
        for <linux-next@vger.kernel.org>; Mon, 07 Dec 2020 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1fLpHyStJBLv4aqDCL/7SVHpDLwiRrQzoRyrVsNBNNw=;
        b=jNsLsfeV2FkguEwqHIJLI4rYmYRF1wgUtiYqQqIWfatqST5/EFGHOcLs+JlHGF1sLJ
         4JBP6HOQLZw7L8sCJYntHm+guWJwv5ev6HKQvgfw8ahmy27wZXtrUH6qjosvnA/oRqih
         CWOov84H1+Ujj81/cwqrSte8yOSjXq5VxD3ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1fLpHyStJBLv4aqDCL/7SVHpDLwiRrQzoRyrVsNBNNw=;
        b=tPvK5/GsgTcJgNDrwG8e55kaGmWK0/87Gp65faYBWYU9tjPEQQNMC8RzKWAIGPQXEd
         nM22iW5BYeP52QPxIobZO+qxeQh0f+okU73Tjb5C/bAMtp9xCMoJzn7cL0PBcmf/S2Da
         TLTWTdInhix/qt1HZv40x1and6kReq93rn10wP3r+8seHt8Az1BLTsWCa2e7QLavQ9XY
         +gz1VE0s/4R8HswrTglZDiadf4yuxfMTb56OpK6CE5yNtVgmUm/sLNFg3lb1mhNuSWDL
         32RJdOuopDynyBcaEvbtG/pi4ptOqgrFCgkiN+EHOOrkEsGBJe6Qn9lhE/r0nRjlzZaz
         X4kw==
X-Gm-Message-State: AOAM5339zxlHXSv5o4vJg+/1p1q1hXc+/kqqrUScrI3dTL4pkHjxPOKI
        93JMemjNyYUE/aKKNa2XH7OdzQ==
X-Google-Smtp-Source: ABdhPJzC2Cp/8Sf+L1ff7VBAIICLIXnXpNa/LfTinUDha9V4CAAhbm1VDVmv3BRLiyb0CFIZG9yfDw==
X-Received: by 2002:a17:907:20a4:: with SMTP id pw4mr20120451ejb.499.1607371477671;
        Mon, 07 Dec 2020 12:04:37 -0800 (PST)
Received: from ?IPv6:2a04:ee41:4:1318:ea45:a00:4d43:48fc? ([2a04:ee41:4:1318:ea45:a00:4d43:48fc])
        by smtp.gmail.com with ESMTPSA id e10sm13809540ejl.70.2020.12.07.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:04:37 -0800 (PST)
Message-ID: <aeeb146ca7b4194e23e99fc3cd0fa0dcdc951651.camel@chromium.org>
Subject: Re: [PATCH bpf-next] bpf: Only call sock_from_file with CONFIG_NET
From:   Florent Revest <revest@chromium.org>
To:     bpf@vger.kernel.org
Cc:     ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        kpsingh@chromium.org, rdunlap@infradead.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 07 Dec 2020 21:04:36 +0100
In-Reply-To: <20201207195539.609787-1-revest@chromium.org>
References: <20201207195539.609787-1-revest@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-12-07 at 20:55 +0100, Florent Revest wrote:
> This avoids
>   ld: kernel/trace/bpf_trace.o: in function `bpf_sock_from_file':
>   bpf_trace.c:(.text+0xe23): undefined reference to `sock_from_file'
> When compiling a kernel with BPF and without NET.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Florent Revest <revest@chromium.org>
> ---
>  kernel/trace/bpf_trace.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 0cf0a6331482..877123bae71f 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1272,7 +1272,11 @@ const struct bpf_func_proto
> bpf_snprintf_btf_proto = {
>  
>  BPF_CALL_1(bpf_sock_from_file, struct file *, file)
>  {
> +#ifdef CONFIG_NET
>  	return (unsigned long) sock_from_file(file);
> +#else
> +	return NULL;

Ugh, and of course I messed up my fix... :) Now this causes a:

./include/linux/stddef.h:8:14: warning: returning ‘void *’ from a
function with return type ‘u64’ {aka ‘long long unsigned int’} makes
integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
kernel/trace/bpf_trace.c:1278:9: note: in expansion of macro ‘NULL’
 1278 |  return NULL;

So I'm sending a v2!

