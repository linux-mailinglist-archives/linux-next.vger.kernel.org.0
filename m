Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED483C6758
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 02:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbhGMAL3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 20:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhGMAL3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 20:11:29 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED7CC0613DD;
        Mon, 12 Jul 2021 17:08:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u3so5020153plf.5;
        Mon, 12 Jul 2021 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=40W98yfK4KrBzbcncfTYQiMKY3aE+mGB+FwnqwurC4g=;
        b=ZE4YVgaxTmwdPvSnbz0qtGaX6UiIHUSawC3XZCnnEOdygBgUlESXtkYMouLl/eWWP+
         5yp6bOe7+TtezXgEkxF5Mbbr8fetEzv/9f8oC8KE7KxzWvvUg2IEs/SjEuz9tU4O2bDp
         VCoj9sloW3dO34Q5Oh9V/PQ7aD6wl/yUHE7zAYVEov6OzjCQdfug5PEBKeu4DCsi/KHl
         SAMvizefI4o4BVP7EERNkftbgxnJJW8BJYvjvA5wlqmuc24Pa+ZJ9iu+bcyHFvpa2wtt
         F0EFqb8OmcYsYve26svL6hNcqlD4JtF1xRGic1AfKHTfLPF91be5DJq54zwWq+2Q7hQJ
         K+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=40W98yfK4KrBzbcncfTYQiMKY3aE+mGB+FwnqwurC4g=;
        b=b8syNR6D0cEWfXXjB5tSWUqW1qk3crEQSeundScMtB2Mjmupw83vKLSHJsdiehTMIh
         C4RJA75gKah/3wAqO/IkFBgnlWj3JPsk4BDZQyfmTCnGeV9ui48VzUH4CT3sDACZaw/O
         I7vZGLNT8Fohtq5PlLtPbZaPyjbOHylqyFgQNkRP9PmvsWCC1F08jtkc2o0RpBiFJxwH
         xwC216OB0PHDgQFABaZ8JTydMQ9++aqiYve9DYfkvXuxGjw6e6km2B427FT04LsD0P27
         1adI5zL8eFpsgTDaf62cmXfOb9wZd/3vAMlpglxUYYeBb1arlL8bTbnL++vTV4ruAxlC
         yRng==
X-Gm-Message-State: AOAM531oHks4EKRh6rqYqRF4oqJMmjqdUW4DsWg/IF22Y4PyarXJm8R5
        pGFyY5zuSIX+77BI+EQpOy1RECfoPpZ+mw==
X-Google-Smtp-Source: ABdhPJyVfHufNBXR90MoYGGPcspdPWV95//BgOYhElMG7uF27bRhRcxaEY4Dh9I9KqPfZZW6fZ5OwA==
X-Received: by 2002:a17:90a:bc84:: with SMTP id x4mr16201107pjr.236.1626134919871;
        Mon, 12 Jul 2021 17:08:39 -0700 (PDT)
Received: from localhost ([2600:380:7562:f3b8:f3a:2580:7cd3:cf61])
        by smtp.gmail.com with ESMTPSA id h24sm17512432pfn.180.2021.07.12.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 17:08:39 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Mon, 12 Jul 2021 14:08:37 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the workqueues
 tree
Message-ID: <YOzZhUm9pTtuX23V@mtj.duckdns.org>
References: <20210713091825.7cfaf3fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713091825.7cfaf3fb@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

On Tue, Jul 13, 2021 at 09:18:25AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   65160ab66cb6 ("cgroup1: fix leaked context root causing sporadic NULL deref in LTP")
> 
> is missing a Signed-off-by from its committer.

Fixed. Sorry about that. Thanks.

-- 
tejun
