Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E885307D8
	for <lists+linux-next@lfdr.de>; Mon, 23 May 2022 04:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbiEWC65 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 May 2022 22:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234387AbiEWC65 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 May 2022 22:58:57 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567CF37A3E
        for <linux-next@vger.kernel.org>; Sun, 22 May 2022 19:58:55 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n18so11891337plg.5
        for <linux-next@vger.kernel.org>; Sun, 22 May 2022 19:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JYI4hxtQWs8QIvdZkiaIHH+G2sDwWzCIkLUOgnf5B6Q=;
        b=JhF7LtraRZMNB9EOjvD8+qUU7bFCMUE4ySVunQJvSZndC6TsJGeWQBwbvl+ipSLrQF
         GICnxUjGL+r7gaqBNke5I4TIfl06jIMNhjsKW/mNffHq94h4itXE1KU4GeTn0zWenBjJ
         T8BY+dvxw1f2Fndc8hRGjpCoAMon98ILs4MvIv3ycsrvnro3LE/92vJgjxtvKeNynGbm
         do0r1JxwwUtJ+jo+gkOXJAe7w3atIBfmj6qxmCToi/E7jDAZWhgucjdDBS6UFs+BJxb4
         rmVP9D5jcFkSjzjNGSMEl0nc+cj1T3sOy6mdx6fY05XVHhD+uYnne95pU8u0ztI9TC3s
         Xh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JYI4hxtQWs8QIvdZkiaIHH+G2sDwWzCIkLUOgnf5B6Q=;
        b=LP9CZYkD6d15oBt6GUajYEzFFcZPbUTmW8e+QSQCioV03K+2YklxHXr2MkQNbuau1D
         j0dfyR+gylOOFxNmMKxuGQN9LM2M9kU/+hogyoWENaHoubJC7VTIAdioXqUny1dzCefH
         MvOicKnV1wqQ/I/aTtld/mFv4ncuLocP7lUBfIj5Y/mqhu+9uEwpLvP+mbtX2zcmmUkV
         RM5LmuueuuAEQ8EXo1aU1aVhh4FOaYQdwHB5Y/N/rrSArMC9ORfigd44hpq/disQeHpu
         rapEkSOvEppDMr9H9PyUEIILHX76XPskkNO9TnvhUqAOnvQvSDCkDalsgC36GfMBN1jm
         akyQ==
X-Gm-Message-State: AOAM53137oaKfaGOdHUBGxU/Fg4oia06kAmJNX2p3wHAw/EPTWOz1yCZ
        jvEgdYewrDN+LPfpIS7wAq78JyUwZ1l/ZQ==
X-Google-Smtp-Source: ABdhPJwvmVfdIQ4Kob1VBnYgYAZv7OOxEaDSN2rnRstzDdI4EEH44wEGzuEPJzx1lRN4zWlpSxCRqg==
X-Received: by 2002:a17:90a:7041:b0:1df:cc3a:10e2 with SMTP id f59-20020a17090a704100b001dfcc3a10e2mr23657280pjk.48.1653274734663;
        Sun, 22 May 2022 19:58:54 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902d2c300b0015e8d4eb277sm3796176plc.193.2022.05.22.19.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 19:58:54 -0700 (PDT)
Message-ID: <0b1ceba8-fca1-3b47-411b-434c4c46ac45@kernel.dk>
Date:   Sun, 22 May 2022 20:58:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Dylan Yudaken <dylany@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220523122827.657f2ab8@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220523122827.657f2ab8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/22/22 8:28 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/io_uring.c
> 
> between commit:
> 
>   4329490a78b6 ("io_uring_enter(): don't leave f.flags uninitialized")
> 
> from the vfs tree and commit:
> 
>   3e813c902672 ("io_uring: rework io_uring_enter to simplify return value")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Fixup looks good, thanks.

-- 
Jens Axboe

