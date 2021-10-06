Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C31C4245D8
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 20:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhJFSSn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 14:18:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:42515 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhJFSSn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Oct 2021 14:18:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="226382702"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="226382702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 11:16:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="484214643"
Received: from sschwenc-mobl1.amr.corp.intel.com (HELO [10.209.2.213]) ([10.209.2.213])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 11:16:50 -0700
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <20211005190628.1f26b13d@canb.auug.org.au>
 <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
 <2216e7c0-093b-3d90-ae1c-91902147fe05@intel.com>
 <20211006105621.7219404f@gandalf.local.home>
 <a053e10c-64ae-4868-b34c-d588bb3dca18@infradead.org>
From:   Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
 z5cecg==
Message-ID: <4f6df3bd-28e1-b6e6-7c87-af7fdf2ec22f@intel.com>
Date:   Wed, 6 Oct 2021 11:16:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a053e10c-64ae-4868-b34c-d588bb3dca18@infradead.org>
Content-Type: multipart/mixed;
 boundary="------------0CEE4FD79D59425ECF720C35"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------0CEE4FD79D59425ECF720C35
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 10/6/21 9:39 AM, Randy Dunlap wrote:
>>>> ../mm/migrate.c:3216:22: error: 'migrate_on_reclaim_callback' defined
>>>> but not used [-Werror=unused-function]
>>>>   static int __meminit migrate_on_reclaim_callback(struct
>>>> notifier_block
>>>> *self,
>>>>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> ../mm/migrate.c:3197:13: error: 'set_migration_target_nodes' defined
>>>> but
>>>> not used [-Werror=unused-function]
>>>>   static void set_migration_target_nodes(void)
>>>>               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>>
>>>> (example usage to get the randconfig files:
>>>> KCONFIG_SEED=0xBFBEA13C make [ARCH=x86_64] randconfig
>>>> )

Randy, thanks for the .config!  That did the trick.

Andrew, attached is a replacement patch for

	mm-migrate-add-cpu-hotplug-to-demotion-ifdef.patch

I could do an incremental as well if that would be easier.  But, the fix
here required a bit of a change of tactics from the original and
necessitated a rewrite of the changelog.

--------------0CEE4FD79D59425ECF720C35
Content-Type: text/x-patch; charset=UTF-8;
 name="mm-migrate-separate-CPU-and-memory-hotplug-notifiers.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="mm-migrate-separate-CPU-and-memory-hotplug-notifiers.patch"

Subject: [PATCH] mm/migrate: separate CPU and memory hotplug notifiers
Date: Wed, 6 Oct 2021 11:08:46 -0700
Message-ID: <20211006180846.3321352-1-dave.hansen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924161255.E5FE8F7E@davehans-spike.ostc.intel.com>
References: <20210924161255.E5FE8F7E@davehans-spike.ostc.intel.com>

From: Dave Hansen <dave.hansen@linux.intel.com>

Once upon a time, the node demotion updates were driven solely by memory
hotplug events.  But now, there are handlers for both CPU and memory
hotplug.

However, the #ifdef around the code checks only memory hotplug.  A system=

that has HOTPLUG_CPU=3Dy but MEMORY_HOTPLUG=3Dn would miss CPU hotplug ev=
ents.

Update the #ifdef around the common code.  Add memory and CPU-specific
option are off.  Move some CPU-hotplug-specific functions to reside under=

their specific #ifdef.

Link: https://lkml.kernel.org/r/20210924161255.E5FE8F7E@davehans-spike.os=
tc.intel.com
Fixes: 884a6e5d1f93 ("mm/migrate: update node demotion order on hotplug e=
vents")
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "Huang, Ying" <ying.huang@intel.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Wei Xu <weixugc@google.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: David Rientjes <rientjes@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Yang Shi <yang.shi@linux.alibaba.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 mm/migrate.c | 78 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index a6311e46f605..5282157575ba 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -3066,7 +3066,7 @@ void migrate_vma_finalize(struct migrate_vma *migra=
te)
 EXPORT_SYMBOL(migrate_vma_finalize);
 #endif /* CONFIG_DEVICE_PRIVATE */
=20
-#if defined(CONFIG_MEMORY_HOTPLUG)
+#if defined(CONFIG_MEMORY_HOTPLUG) || defined(CONFIG_HOTPLUG_CPU)
 /* Disable reclaim-based migration. */
 static void __disable_all_migrate_targets(void)
 {
@@ -3198,35 +3198,7 @@ static void __set_migration_target_nodes(void)
 		goto again;
 }
=20
-/*
- * For callers that do not hold get_online_mems() already.
- */
-static void set_migration_target_nodes(void)
-{
-	get_online_mems();
-	__set_migration_target_nodes();
-	put_online_mems();
-}
-
-/*
- * React to hotplug events that might affect the migration targets
- * like events that online or offline NUMA nodes.
- *
- * The ordering is also currently dependent on which nodes have
- * CPUs.  That means we need CPU on/offline notification too.
- */
-static int migration_online_cpu(unsigned int cpu)
-{
-	set_migration_target_nodes();
-	return 0;
-}
-
-static int migration_offline_cpu(unsigned int cpu)
-{
-	set_migration_target_nodes();
-	return 0;
-}
-
+#if defined(CONFIG_MEMORY_HOTPLUG)
 /*
  * This leaves migrate-on-reclaim transiently disabled between
  * the MEM_GOING_OFFLINE and MEM_OFFLINE events.  This runs
@@ -3284,7 +3256,45 @@ static int __meminit migrate_on_reclaim_callback(s=
truct notifier_block *self,
 	return notifier_from_errno(0);
 }
=20
-static int __init migrate_on_reclaim_init(void)
+static int __init migrate_on_reclaim_init_memhp(void)
+{
+	hotplug_memory_notifier(migrate_on_reclaim_callback, 100);
+	return 0;
+}
+late_initcall(migrate_on_reclaim_init_memhp);
+#endif /* CONFIG_MEMORY_HOTPLUG */
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * For callers that do not hold get_online_mems() already.
+ */
+static void set_migration_target_nodes(void)
+{
+	get_online_mems();
+	__set_migration_target_nodes();
+	put_online_mems();
+}
+
+/*
+ * React to hotplug events that might affect the migration targets
+ * like events that online or offline NUMA nodes.
+ *
+ * The ordering is also currently dependent on which nodes have
+ * CPUs.  That means we need CPU on/offline notification too.
+ */
+static int migration_online_cpu(unsigned int cpu)
+{
+	set_migration_target_nodes();
+	return 0;
+}
+
+static int migration_offline_cpu(unsigned int cpu)
+{
+	set_migration_target_nodes();
+	return 0;
+}
+
+static int __init migrate_on_reclaim_init_cpuhp(void)
 {
 	int ret;
=20
@@ -3299,8 +3309,8 @@ static int __init migrate_on_reclaim_init(void)
 	 */
 	WARN_ON(ret < 0);
=20
-	hotplug_memory_notifier(migrate_on_reclaim_callback, 100);
 	return 0;
 }
-late_initcall(migrate_on_reclaim_init);
-#endif /* CONFIG_MEMORY_HOTPLUG */
+late_initcall(migrate_on_reclaim_init_cpuhp);
+#endif /* CONFIG_HOTPLUG_CPU */
+#endif /* CONFIG_MEMORY_HOTPLUG || CONFIG_HOTPLUG_CPU */
--=20
2.25.1


--------------0CEE4FD79D59425ECF720C35--
