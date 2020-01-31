Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984D014E693
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 01:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgAaAZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 19:25:56 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42097 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbgAaAZ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jan 2020 19:25:56 -0500
Received: by mail-pg1-f193.google.com with SMTP id s64so2502026pgb.9
        for <linux-next@vger.kernel.org>; Thu, 30 Jan 2020 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e8xT5Ubn9DukKbcAsd6bGB0RwaMzxXREbkgWWCe0L+g=;
        b=gn5l/IGF9KykwcBj18LcB42fliuaVC8HE2uZIhiPXHd7vSaKidkWEJDLlwFsu47suQ
         ChhAoRjB3EA8x8e1vKweoYrUtveNTjevaonAdsXTs/ukEc17iTAM2/Dfbn05WvonNpzj
         W25OT71K00u1D6/dQdcdyskAWuH6fZhxOZIks8A3cHxxE1bEWL2McEbE2aqZ1My7Iph2
         lLN9yezgmPlqHo9O9PnbTmmWHllXO/KpOLpWKnOGNcguh4WO1Vg8DIp6nZuzVJGIcX4Q
         lNQYq3u0FdgJkx47IRYQ/eFMnwiOToO+vMjNW5osyXtgQ4ymm9K6di+vmmnHh37MqvaC
         pa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e8xT5Ubn9DukKbcAsd6bGB0RwaMzxXREbkgWWCe0L+g=;
        b=jV/H5EcPrUDyYa1+1LwWFUGsKp9/JuwNRpTPIP9U3lcT5em+SxEnSvN28jiXjWbA01
         jaiRj63UtBcsnOO7rNt+5hLlYQuXKSigbg6aC4NFpnEzY+XYbigcg6jKC0nVKQCoBHmx
         cgnOnIRZP9dTLLLRvQNtJh/SlCa2nS0DMvTfcWLdv9bhCUjLPo4iTvyCgqAYA1UjWg05
         va3JPThH576c23DeDfj162Bn8KYLJZ4BfTbd3l14R7T0MxDh+FtAeOABaDJJcGmy1xxO
         B/o365Snon3yUOEev+H3HPq4dnAm6z9r4JkWJanp7ruSSnD8wbQjzCE69qf9PtuFU81P
         Jvvg==
X-Gm-Message-State: APjAAAVe0xFpcFwUKzFfwx3mB3Z46UO+Q5uCF/zSqOM9NNufLMHnXCB9
        5QEF+aosO4QsQjrgp/O+hI6Z/A==
X-Google-Smtp-Source: APXvYqxu/vmouCWvTcNoQCm3tuieIQqBPvowtVLmEaSEsTTgeENnXXU90/k+hG41yffYs88+YfpKLw==
X-Received: by 2002:a62:4d87:: with SMTP id a129mr7607326pfb.116.1580430355699;
        Thu, 30 Jan 2020 16:25:55 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id y10sm6449165pfq.110.2020.01.30.16.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 16:25:55 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200131111652.6995fc6d@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d3652266-3e13-9aa8-887e-9f7a69f57285@kernel.dk>
Date:   Thu, 30 Jan 2020 17:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131111652.6995fc6d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/30/20 5:16 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> fs/io_uring.c: In function '__io_uring_show_fdinfo':
> fs/io_uring.c:6558:32: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
>  6558 |   seq_printf(m, "%5u: 0x%llx/%lu\n", i, buf->ubuf, buf->len);
>       |                              ~~^                   ~~~~~~~~
>       |                                |                      |
>       |                                long unsigned int      size_t {aka unsigned int}
>       |                              %u
> 
> Introduced by commit
> 
>   0380f1b6d0c6 ("io_uring: add ->show_fdinfo() for the io_uring file descriptor")

Thanks, did fix that up, forgot to push to for-next... Will rectify that now.

-- 
Jens Axboe

