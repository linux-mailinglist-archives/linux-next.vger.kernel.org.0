Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E665752E7
	for <lists+linux-next@lfdr.de>; Thu, 14 Jul 2022 18:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiGNQgk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jul 2022 12:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiGNQgi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Jul 2022 12:36:38 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA425A2F1
        for <linux-next@vger.kernel.org>; Thu, 14 Jul 2022 09:36:38 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 23so2039761pgc.8
        for <linux-next@vger.kernel.org>; Thu, 14 Jul 2022 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qJq/9VO0RiGUeQoupgJtjYlbFevkBFFS2JBjwLHRB28=;
        b=QHWviJLgTPtOWeq4sUL1bq618FoaKGeLI7ofn+LcKxyAMz+BmjTZ68UeveM7WuU07q
         sIJaSUSVoTDqOySdp3Sw2p40TmYncfZxwHjY7RCPwPp13P+lGywh0cKvsy2AUrVO5Jxy
         So6hgrq25o48g/Qo3rBBwrvtfSa//I4fxQF8DruTruWWz3mxDNhgCvpvBOZGmRAr7SEJ
         7Vt+4OGx8FTk4eUMxi1FyRjSgrkkD3I8TeIYIdFcTFURST67DyQOpsEWcOLfqlpJ/oEh
         lYeIUqjmSg+BgdEa+9R1K0Up5/DPR2PSVzSbUm2uR+abbuFGMx3r676XbkFlJF+YE/uD
         Da/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qJq/9VO0RiGUeQoupgJtjYlbFevkBFFS2JBjwLHRB28=;
        b=C/7/k+fl+52tdvGe2vGPlNgVcznf5P7PhTkt8Yf3w63S2ZElHk0zNZxjBY5oLP/4WI
         J0iuo0tROBmBY1LzGsCKWNqOQOMYRjlj+wOiM6CzNU89gM1M2q+hocrzepAu6MUKAvcA
         Se9RQ2+iA7zKI11vRwgYAk+CazoI2tf6sYXS4AY+pSwl8VRh/o4g1lI4BfL/SQtXCQIO
         RCAsbnNSJ7eP53j9vslTUgx2geVvOILNGMeAk6hT9qlHFAa3IZ02vZZonBQIkYkEOlmz
         bOy/SngArXo5K1/1gOQTwVff9jraKyeccrAzmmDpElDg+IsCf8JiNLcHxtsZIgNrKeUK
         OjBQ==
X-Gm-Message-State: AJIora9BY300ol9pERzAolw11h3nDD2TW/pEfAYHH+42cuxJ9Oa+KvA1
        NHAMCWDY5HXj0mY9S4NrCiKGokEhkp7PyQ==
X-Google-Smtp-Source: AGRyM1vTFXTPbN8ejq1bAfzPOBZEjeG7EmOWXT98RYjKLECxbQCCJ3td4g8gXPwNeoVOb7IsSfJSPA==
X-Received: by 2002:a05:6a00:cc7:b0:52a:e51c:dc18 with SMTP id b7-20020a056a000cc700b0052ae51cdc18mr9293156pfv.56.1657816597588;
        Thu, 14 Jul 2022 09:36:37 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902c40400b0016782c55790sm1745270plk.232.2022.07.14.09.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 09:36:37 -0700 (PDT)
Message-ID: <0904ae71-972f-f183-f295-bce3b8518fcf@kernel.dk>
Date:   Thu, 14 Jul 2022 10:36:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Keith Busch <kbusch@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220714120840.1e1f8c63@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220714120840.1e1f8c63@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/13/22 8:08 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/bio.c
> 
> between commits:
> 
>   35006342b739 ("block: ensure iov_iter advances for added pages")
>   248022ffae3f ("block: ensure bio_iov_add_page can't fail")
>   7b1ccdf617ca ("block: fix leaking page ref on truncated direct io")
>   9a6469060316 ("block: convert to advancing variants of iov_iter_get_pages{,_alloc}()")
> 
> from the vfs tree and commits:
> 
>   5a044eef1265 ("block: ensure iov_iter advances for added pages")
>   ac3c48e32c04 ("block: ensure bio_iov_add_page can't fail")
>   44b6b0b0e980 ("block: fix leaking page ref on truncated direct io")
> 
> from the block tree.

I pinged Al about this the other day, but haven't heard back yet. It's
not clear to me what block bits he has in his tree. We'll get it sorted
out.

-- 
Jens Axboe

