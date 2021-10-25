Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0BC43A654
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 00:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhJYWNd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 18:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhJYWNd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 18:13:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57791C061745;
        Mon, 25 Oct 2021 15:11:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 65so10664460ljf.9;
        Mon, 25 Oct 2021 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jnJPOeCbQXa02500VcgaQpnDnVBb4y7OeBcRepQOJq0=;
        b=ay5psKIRkBjd/drFSzxVQXV78+YaUjt8TGBwMYrMohRTTLX5W9L4tjaAACRe+4NEY0
         eDHHXy+O/F6xam8TZDrcfOjFjGUnX1eAzZ1pvAmlqXwW++LIQJLgXrHLVwelI4P1mIrr
         G5cgC39ICPEpOpvOCojMZaOY8DEXqeUxZxXSETXmnzbLA5HrfxTBXnJWIpgqXMo9SqFL
         wOY3mgFZTW4FaApb4Oih8uIRt9r6SLmCaeqAPuSkmWfNibYrDnOwxmYQdz+k8AzcAeYZ
         6pwThrN/pDFPHh5GnINv86rwPzaVGjhdBMRlIBJ5FHRtlP7Cc45qI3pgLe8lHAe2rqOx
         jHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jnJPOeCbQXa02500VcgaQpnDnVBb4y7OeBcRepQOJq0=;
        b=36Lr7QGZeCMMZJKAwgHh98CHyXrWQTedthWizJNY4hM3wO213dGIa4x8cgM2MrgMxw
         J/f8nid4/ZMkS08k5Ra6o1tw1xlQnSwLXYXCG6OaC6M25tHor2zjOQDQiQ+xX32VWjhG
         gSEXTyGKiGEJCQR+mUhS7NTFbXAtAFMeOYICjuH07c9FDvAIU9nr5+0wfAdWMfvNlexq
         7iGw4bHQ/XDaypH9cZWnlvDHMX9bQWlqwPsxYdq+/s4QRTPrphW6QArgNQlk1AloKOYv
         nCroOttAJihFiPHB3uq/AFfRFQpCsgP4nOUn0oObxvDGAoSQ857u1Vb1SsVGZpgrCpnc
         TIJw==
X-Gm-Message-State: AOAM530gIH5fv9P17uRJ75NiOXSFvG9pbKe4p04AgYJDPKoNz52eBOqy
        Wx+U0437eeEEij49xsQHcNOYZNP4HK8=
X-Google-Smtp-Source: ABdhPJzVz2+3mDSiHAbS68O8OXJLf6tYIH7yzJl3LHe2d/01jTz8Ko+MYn31pgWwaBWJYVfeIQnv3A==
X-Received: by 2002:a2e:9801:: with SMTP id a1mr21663460ljj.183.1635199868527;
        Mon, 25 Oct 2021 15:11:08 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id z13sm1833844ljk.70.2021.10.25.15.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 15:11:08 -0700 (PDT)
Subject: Re: linux-next: Tree for Oct 25
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>
References: <20211025204921.73cb3011@canb.auug.org.au>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82bbf33e-918f-da01-95e6-9b2cc1b8b610@gmail.com>
Date:   Tue, 26 Oct 2021 01:11:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025204921.73cb3011@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

Recent -next has this new warning splat coming from MMC, please take a look.

 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 525 at kernel/sched/core.c:9477 __might_sleep+0x65/0x68
 do not call blocking ops when !TASK_RUNNING; state=2 set at [<4316eb02>] prepare_to_wait+0x2e/0xb8
 Modules linked in:
 CPU: 0 PID: 525 Comm: Xorg Tainted: G        W         5.15.0-rc6-next-20211025-00226-g89ccd6948ec3 #5
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 (unwind_backtrace) from [<c01089f9>] (show_stack+0x11/0x14)
 (show_stack) from [<c0afacb9>] (dump_stack_lvl+0x2b/0x34)
 (dump_stack_lvl) from [<c011f689>] (__warn+0xa1/0xe8)
 (__warn) from [<c0af6729>] (warn_slowpath_fmt+0x65/0x7c)
 (warn_slowpath_fmt) from [<c01421b9>] (__might_sleep+0x65/0x68)
 (__might_sleep) from [<c07eb377>] (mmc_blk_rw_wait+0x2f/0x118)
 (mmc_blk_rw_wait) from [<c07eba11>] (mmc_blk_mq_issue_rq+0x219/0x71c)
 (mmc_blk_mq_issue_rq) from [<c07ec199>] (mmc_mq_queue_rq+0xf9/0x200)
 (mmc_mq_queue_rq) from [<c04ad247>] (__blk_mq_try_issue_directly+0xcb/0x100)
 (__blk_mq_try_issue_directly) from [<c04adb89>] (blk_mq_request_issue_directly+0x2d/0x48)
 (blk_mq_request_issue_directly) from [<c04adcf3>] (blk_mq_flush_plug_list+0x14f/0x1f4)
 (blk_mq_flush_plug_list) from [<c04a5313>] (blk_flush_plug+0x83/0xb8)
 (blk_flush_plug) from [<c0b013cb>] (io_schedule+0x2b/0x3c)
 (io_schedule) from [<c0b01a17>] (bit_wait_io+0xf/0x48)
 (bit_wait_io) from [<c0b01783>] (__wait_on_bit+0x3f/0x88)
 (__wait_on_bit) from [<c0b01823>] (out_of_line_wait_on_bit+0x57/0x68)
 (out_of_line_wait_on_bit) from [<c03539c1>] (ext4_read_bh+0xb1/0xb4)
 (ext4_read_bh) from [<c03146b3>] (__read_extent_tree_block+0xa7/0x134)
 (__read_extent_tree_block) from [<c031526f>] (ext4_find_extent+0x13b/0x2fc)
 (ext4_find_extent) from [<c0317da5>] (ext4_ext_map_blocks+0x4d/0x1160)
 (ext4_ext_map_blocks) from [<c03286c3>] (ext4_map_blocks+0x1bf/0x428)
 (ext4_map_blocks) from [<c03436b1>] (ext4_mpage_readpages+0x399/0x660)
 (ext4_mpage_readpages) from [<c02322d9>] (read_pages+0x51/0x18c)
 (read_pages) from [<c02324f5>] (page_cache_ra_unbounded+0xe1/0x174)
 (page_cache_ra_unbounded) from [<c02299c1>] (filemap_get_pages+0xc5/0x524)
 (filemap_get_pages) from [<c0229eff>] (filemap_read+0xdf/0x2fc)
 (filemap_read) from [<c028bae9>] (vfs_read+0x151/0x23c)
 (vfs_read) from [<c028bf4b>] (ksys_read+0x47/0x98)
 (ksys_read) from [<c01000a1>] (ret_fast_syscall+0x1/0x16)
 Exception stack(0xc593ffa8 to 0xc593fff0)
  
