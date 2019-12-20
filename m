Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62688127558
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 06:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfLTFfB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 00:35:01 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:36749 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfLTFfB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 00:35:01 -0500
Received: by mail-io1-f65.google.com with SMTP id r13so8209864ioa.3
        for <linux-next@vger.kernel.org>; Thu, 19 Dec 2019 21:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bJH9ngAKUt2zZBSAR+jdXkYppUB/dH1U+o3RlVCLv24=;
        b=MSLKMuHu9QZksGDMR6iUQ/crRkDEPYDqT4JZL7mzTHB6il8vBxzjQRibZnMfCeT2le
         mQida8F+9unRkoc1GnDv4mI9YgnWe4GyoeK7jjYVPdrZtNVSRl4AM8yGg+29WN1dGwug
         VTLCzs7L6SS5hPiivZvxr3YennyaDl2vj7jCX03XRxW5Loh1HeH/mGVl2dLvu0gSyhhu
         DpRPoS7E4pPCerJDnXIK+sTEnhPo4HYvBa9x3kXqYm65XfftWoxUyOFeUfOj73fZam6G
         /6MvRT0FkORkkE2gjxcJxGRZm0wdNDGFGf3rTGB97TetN1i9BDOJK79BjRuNDdLb5dzY
         Fz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bJH9ngAKUt2zZBSAR+jdXkYppUB/dH1U+o3RlVCLv24=;
        b=DASGjMT4TjA/jT3VXpAqHghHjFcvwdcuq/3OerJ8loxF716E4s3JRxfbAinu9MSB6s
         /fv70Ov2m94MvgSa9ZeB9x4/DsWZzIcMJxRxg+Q8I2cOIvfqd/p//ft/MuTh+yiSjbV8
         J2RTUGrgduRb7z11x1/OmRaud00sm52YGsqfo+X+Pf1p2ksjzS6J2kJju7p8iuJVmIc/
         MsZo4dPxGMLPeg1JbGRdGDeG+8x4LdaM/Z/6oD9mChSfhKI067YN8YW93CFsDR4ovAfH
         dgTBT2fdEdqxCBsJxrlwQlqRWdPGQv6RxGq3vXH1vV59laG9EnTeDF1+l7Hbu89HfVF6
         CnyQ==
X-Gm-Message-State: APjAAAVQxmyvDWhiTmysEiHlQN9URHvIH2xSumuDxsxU9H8/ZQWSqb/6
        8C2m58cuScTByK3e6vefvJ5gDqGeG0BA2w==
X-Google-Smtp-Source: APXvYqz3mkdhGZsgbEu11Mzt0Nz4pjnOdDnxa00QXAm4U97lfdYncbGpna1SDIs8u3ttfnE7oQWhUQ==
X-Received: by 2002:a6b:c8c8:: with SMTP id y191mr9069907iof.104.1576820100628;
        Thu, 19 Dec 2019 21:35:00 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h3sm3880783ilh.6.2019.12.19.21.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 21:35:00 -0800 (PST)
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
References: <20191220123614.5f11d2e3@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f6ff3aa5-e08b-8b25-454a-9aa51b8b5c37@kernel.dk>
Date:   Thu, 19 Dec 2019 22:34:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220123614.5f11d2e3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/19/19 6:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/open.c
> 
> between commit:
> 
>   0a51692d49ec ("open: introduce openat2(2) syscall")
> 
> from the vfs tree and commit:
> 
>   252270311374 ("fs: make build_open_flags() available internally")
> 
> from the block tree.
> 
> I fixed it up (see at end, plus the merge fix patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Thanks Stephen, I may just pull in the vfs tree to avoid this conflict.

-- 
Jens Axboe

