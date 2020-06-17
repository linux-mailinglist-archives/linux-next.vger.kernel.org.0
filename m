Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D1E1FD6BB
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 23:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFQVJk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 17:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgFQVJj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 17:09:39 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEB1C061755
        for <linux-next@vger.kernel.org>; Wed, 17 Jun 2020 14:09:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p20so4066264ejd.13
        for <linux-next@vger.kernel.org>; Wed, 17 Jun 2020 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GnlvPSerxYaAs6hWRcO3L/sFpo0oIyfxiPHzK2Wgw2s=;
        b=T+HY36Q/lEESXtbAjRazJHG9pFle+8cGtCTZpBVsZIlTCobcNWut5N//BlE288guEQ
         iCNtMW72qvyh67TSiNdfeTcAxke2e6XhCIJX2Bo4CNHZkKIP0jJ2wH9UeDZtDcpHov46
         LEwRTPJL7zUnoJiXRhzcsyLY3ZUXRK1pY0lGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GnlvPSerxYaAs6hWRcO3L/sFpo0oIyfxiPHzK2Wgw2s=;
        b=ilpWWASygJXalUjItm9/Anl00C7YW2gmuFqLxuowRBx3RQZfsF2hQpk1e4ehnSjUe0
         baDZi9ositU5Lh+NCNcnPPRu/YTVu5RLSQh1jbwhimnmHO68w3Wr8/umTClV2idrQ8BJ
         FRaxbuig049q5AnAqZPoHC7pKV8BePIAdGxGKOqvrVh9U5HuahemclYFExmtiE5cOkW1
         aerTUyOOq8hzlaM3CEUmNaQsesbPStGB03IPBxdoxslipurJU1i9xfJUnlSZ3g3Rsp6A
         qPnyG/y3oqIBKSkJpaDtHFfbEkBrLZ5Z77/O7Ogso3aEQhLdUtp6WjJ4Dqqi/SiNtB5v
         YbmQ==
X-Gm-Message-State: AOAM530YfVH+gTJEBJdoolJYHvEXPHyPiPPBjPJztKYxygr+5+u8gwvY
        1d2oZO+0c/S+iSD7cAecTO+t+A==
X-Google-Smtp-Source: ABdhPJwuyZu1HhU791sBbMRK/ZbSLJLyUpbWnlc0i4hDf4PqnQsmLlcN1hJEafL4nFevrmcrajCW7A==
X-Received: by 2002:a17:906:344c:: with SMTP id d12mr981887ejb.130.1592428176328;
        Wed, 17 Jun 2020 14:09:36 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:3f56])
        by smtp.gmail.com with ESMTPSA id o8sm714704ejx.84.2020.06.17.14.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:09:35 -0700 (PDT)
Date:   Wed, 17 Jun 2020 22:09:35 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        "Linux F2FS DEV, Mailing List" 
        <linux-f2fs-devel@lists.sourceforge.net>,
        linux-ext4 <linux-ext4@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Theodore Ts'o <tytso@mit.edu>, Chao Yu <chao@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Chao Yu <yuchao0@huawei.com>, lkft-triage@lists.linaro.org,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, Cgroups <cgroups@vger.kernel.org>
Subject: Re: mm: mkfs.ext4 invoked oom-killer on i386 - pagecache_get_page
Message-ID: <20200617210935.GA578452@chrisdown.name>
References: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
 <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Naresh Kamboju writes:
>After this patch applied the reported issue got fixed.

Great! Thank you Naresh and Michal for helping to get to the bottom of this :-)

I'll send out a new version tomorrow with the fixes applied and both of you 
credited in the changelog for the detection and fix.
