Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3E1303609
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 06:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbhAZF6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730312AbhAYPpG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 10:45:06 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E05C06121D
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 07:18:58 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id i5so9111922pgo.1
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MBPqVt45ITLJCzWFHUcX7mkPIKQDJQ44GECVzhqpWDs=;
        b=G3e6OVQKtf9PYFBBqnu0AOCvBcNEwC9QfRFNv8xdM/x+24O80RY6a6VjcakPrZGva2
         j91axmEy5T3xSWpNjPc50h9VLNVUyCGhCMMOeztEC9nRebK9mkBf4eodCu9x/fFclHwV
         aaMyehgVVy8e5suSbAvWIVyCujylV6zlox9mkwSoJIvHUdPRjkWh7cIem6r8IXHnlsiC
         fDMnY0yu+KrV675abtw29Zs/fxNa30ZXITPw/RDaZsuJhyo00M0gDviTwHJxUs1S8Qea
         +waYdVHu2NtwrfHCPVk9YJYa/Yxm3VIsbObYn60XZXlGwlCWC0gmVDhXahraDDBxjsKV
         ro/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MBPqVt45ITLJCzWFHUcX7mkPIKQDJQ44GECVzhqpWDs=;
        b=bWpIZBjp/fReVuzOKfriQi9y2Jp2AHpTA0RalVWfgmO6k9cglRLjwuNWlpVdnSx4Xu
         2Zp5vachMRdetRu0Ps23CsmsoDHXh1/TZuIjjecSZ/BJtYoOjl12ofAUeTuq1BRBW4DE
         ecc5/LEoQBYOzLKtXsjXeu5BlmccgNmu5KJ/xz4NxCmBpwIepvH069ZHmDKQN+4oHA4j
         3M0iaIbDHBoNVJQk1YE9OW+omrNLNA8Zjvb9zJtUPgUHbYg2ujBZ+N673RLybzjJicYq
         wv7Sl+PNl+049a8bI/CC9DfZhPuJnht5q/zPczhKatsd1+rHxAPAogfmeVLKN2myKgPu
         FcJw==
X-Gm-Message-State: AOAM532DlVEB4fSaHB2hy3d5bimQ+9duQHzs6yAvNYOPHVwa/hn58qfP
        SKcTRbr6u7lXDSqXu5zarV0Twk/DVXjSdg==
X-Google-Smtp-Source: ABdhPJzkgcc5IscHt+KOy83sg2XBvPAbFM956SP/fqdTFGtzqO73x70J+0XMfjEVsP8hhFlhwHdQoQ==
X-Received: by 2002:a62:ed09:0:b029:1bb:3ffc:b7f9 with SMTP id u9-20020a62ed090000b02901bb3ffcb7f9mr923337pfh.52.1611587937426;
        Mon, 25 Jan 2021 07:18:57 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id b67sm16883015pfa.140.2021.01.25.07.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 07:18:56 -0800 (PST)
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bijan Mottahedeh <bijan.mottahedeh@oracle.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210125204329.22a4964c@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8a6c48de-7136-97b1-1013-4b707afb5d06@kernel.dk>
Date:   Mon, 25 Jan 2021 08:18:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125204329.22a4964c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/25/21 2:43 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   36962a1e4186 ("io_uring: create common fixed_rsrc_data allocation routines")
>   5bc97865b3b6 ("io_uring: create common fixed_rsrc_ref_node handling routines")
>   b2315a2cda1f ("io_uring: generalize io_queue_rsrc_removal")
>   a63c1259317d ("io_uring: rename file related variables to rsrc")
> 
> are missing a Signed-off-by from their author.

Fixed up, thanks.

-- 
Jens Axboe

