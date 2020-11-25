Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210862C3EFE
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 12:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgKYLWL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 06:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgKYLWL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 06:22:11 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07026C0613D4;
        Wed, 25 Nov 2020 03:22:11 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id x22so1664668wmc.5;
        Wed, 25 Nov 2020 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fkeU+R8hqLO6M6EoSSQ3Z29F32RAQfX44gbdUvYuYKk=;
        b=E8EB971JHAm+5d5XLDQX6YbXCuqVqPuLgJ1Hz/bldINFx2P2ms9DadykgPwgXwrGez
         n6jOMRdIehPlp1KETAoMMKWh98ua8fThgESdlBnfaR1wa7rL+Xx9CHCUiUWKryhZ4anl
         kSbdcLGUGcf5/0oFw0S4p9gz7zJOa733BapxXQ9CyBBxq5NQpd2FC2yXckJZN8ha1pAy
         0CCr/igSBRaA1KG8/Ths79oGhK4k+IGFBq6MlvlwXskbvhTDZZ83hfPWQKIP2PdOMzEG
         G7LEFCmVvG24nc0t17bK+/gyIyzx9y/OqEfFb8v5u8EbxAnL6dJvNFrgCKE7dh/IojW+
         37CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fkeU+R8hqLO6M6EoSSQ3Z29F32RAQfX44gbdUvYuYKk=;
        b=iXg7gDMJI5HyNN8wLaT3gSTsFNp0uBRji6h4aqDk7Rr1eIS88QnjUMwew+o4RCYNfU
         6GESgL9qcfG8WHtWgsRFa5PsvLsUh4auDaxAmyFf5cRiKI65EjZcf9QdHAp1CGDeZ9qI
         Awkg2pEudII72Hoas6ec+zhi4of+IG9BjIp/GnQxczh1uJx3Ml2LbQEQ+efomFEilJ4z
         EYaAi8K/iTQwLknmWsozPtjbd1WDVC63rHxWKbp0mgmAdGer9nCsdddwjGf93L3gSdhC
         8qifqMPQt9H8XJSH9MezyXMngj/Eqnq857eaVG/kBszbVAaqGfLuiGnPispungrbDDPq
         ldvQ==
X-Gm-Message-State: AOAM531QPpZRjqEbRGrO8+9ShCtbcfRckyY7NixaSmWGTY4sIYx1OpJL
        flF0El1UiPh1MyjPc4oY9eY=
X-Google-Smtp-Source: ABdhPJxPtFUEP3o1/V4ITcxbabd0jUN6MY3lbmBnmAFzZ4At5rGyoSPRDyoiSzCvocglqxVj8mNKmg==
X-Received: by 2002:a1c:5a08:: with SMTP id o8mr2821605wmb.142.1606303329695;
        Wed, 25 Nov 2020 03:22:09 -0800 (PST)
Received: from localhost.localdomain (host86-145-187-174.range86-145.btcentralplus.com. [86.145.187.174])
        by smtp.gmail.com with ESMTPSA id 34sm3971188wrh.78.2020.11.25.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 03:22:08 -0800 (PST)
From:   Lorenzo Stoakes <lstoakes@gmail.com>
To:     Alex Shi <alex.shi@linux.alibaba.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hui Su <sh_def@163.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>
Cc:     syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Lorenzo Stoakes <lstoakes@gmail.com>
Subject: [PATCH] mm/memcg: warn on missing memcg on mem_cgroup_page_lruvec()
Date:   Wed, 25 Nov 2020 11:22:02 +0000
Message-Id: <20201125112202.387009-1-lstoakes@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <00000000000054aea005b4d59e71@google.com>
References: <00000000000054aea005b4d59e71@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Move memcg check to mem_cgroup_page_lruvec() as there are callers which
may invoke this with !memcg in mem_cgroup_lruvec(), whereas they should
not in mem_cgroup_page_lruvec().

We expect that we have always charged a page to the memcg before
mem_cgroup_page_lruvec() is invoked, so add a warning to assert that this
is the case.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
Reported-by: syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com
---
 include/linux/memcontrol.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 87ed56dc75f9..3e6a1df3bdb9 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -618,7 +618,6 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
 		goto out;
 	}
 
-	VM_WARN_ON_ONCE(!memcg);
 	if (!memcg)
 		memcg = root_mem_cgroup;
 
@@ -645,7 +644,10 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
 static inline struct lruvec *mem_cgroup_page_lruvec(struct page *page,
 						struct pglist_data *pgdat)
 {
-	return mem_cgroup_lruvec(page_memcg(page), pgdat);
+	struct mem_cgroup *memcg = page_memcg(page);
+
+	VM_WARN_ON_ONCE_PAGE(!memcg, page);
+	return mem_cgroup_lruvec(memcg, pgdat);
 }
 
 static inline bool lruvec_holds_page_lru_lock(struct page *page,
-- 
2.29.2

