Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BED821B5D9
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 15:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGJNH2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 09:07:28 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:46910 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgGJNH1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 09:07:27 -0400
Received: by mail-ej1-f65.google.com with SMTP id p20so5934287ejd.13;
        Fri, 10 Jul 2020 06:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pfcMmD264TAA0dG7QgEoTJZr3IrsKKESoJiHSw+ewYE=;
        b=XIdNqvNjuOqHgg1Fp5jq+hGWLCk/i7kZANMap3jdTHzNGCcy77fYMZMKyPSBpCUqRc
         CypVMEVOkRyQ5Aj1aayQTFzQY2t+Glp0kluZFAVZf2gK+WiRvCNc49ZQ795MLgmXqxgZ
         UhBxw67j3kePSlUrARd4KZXR5SML548B1NDg7yncAlmLvUjpHoLsWPLZtsSlKEDwlZ2g
         S4BarsDLtDbpXh7opgjwQMN/WkLTP3LzKxnR9zzqSUsGAy0P9YGmdcfwEMyGNMfPgypM
         2GurpuYuk/EB9wMSTB6+U2K8exnDTT1pm7YQncHPZdNAz5q43R7VZqh1N5pzVlEHJ/+B
         g9NA==
X-Gm-Message-State: AOAM533B0Rq2jR/eMkreCW6CCq8dbte5uUSs12yY6PpfsptcJBlSJhDJ
        hFPtW31iEgBFoCsF3Ic8zMY=
X-Google-Smtp-Source: ABdhPJzcCCNv0glzJfkwqkDnWUvTMpd4BkwXYu6/DqoyRKcGl+Nm4u0bPblVcZU65jx0Zx/rJB1N8A==
X-Received: by 2002:a17:906:e089:: with SMTP id gh9mr36717032ejb.482.1594386446427;
        Fri, 10 Jul 2020 06:07:26 -0700 (PDT)
Received: from localhost (ip-37-188-148-171.eurotel.cz. [37.188.148.171])
        by smtp.gmail.com with ESMTPSA id u13sm4330481eds.10.2020.07.10.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 06:07:25 -0700 (PDT)
Date:   Fri, 10 Jul 2020 15:07:24 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Yafang Shao <laoar.shao@gmail.com>, rientjes@google.com,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm, oom: make the calculation of oom badness more
 accurate
Message-ID: <20200710130724.GD3022@dhcp22.suse.cz>
References: <1594309987-9919-1-git-send-email-laoar.shao@gmail.com>
 <20200710124253.GA1125@lca.pw>
 <20200710125852.GC3022@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710125852.GC3022@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 10-07-20 14:58:54, Michal Hocko wrote:
[...]
> I will have a closer look. Is the full dmesg available somewhere?

Ups, I have missed this:
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 2dd5a90f2f81..7f01835862f4 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -306,7 +306,7 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 static int oom_evaluate_task(struct task_struct *task, void *arg)
 {
 	struct oom_control *oc = arg;
-	unsigned long points;
+	long points;
 
 	if (oom_unkillable_task(task))
 		goto next;

Does it help?
-- 
Michal Hocko
SUSE Labs
