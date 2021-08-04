Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99C83DFEA3
	for <lists+linux-next@lfdr.de>; Wed,  4 Aug 2021 12:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbhHDKAz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Aug 2021 06:00:55 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:58651 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237336AbhHDKAy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Aug 2021 06:00:54 -0400
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 174A0eWe063169;
        Wed, 4 Aug 2021 19:00:40 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Wed, 04 Aug 2021 19:00:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 174A0d05063165
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 4 Aug 2021 19:00:40 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] linux-next boot error: WARNING in find_vma
To:     Andrew Morton <akpm@linux-foundation.org>,
        Luigi Rizzo <lrizzo@google.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzbot <syzbot+dcb8a1e30879e0d60e8c@syzkaller.appspotmail.com>
References: <0000000000005b873305c8aa6da2@google.com>
 <20210803132426.2f24a3512264e4603a08de57@linux-foundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <58bb6bf7-a57e-8a40-e74b-39584b415152@i-love.sakura.ne.jp>
Date:   Wed, 4 Aug 2021 19:00:37 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803132426.2f24a3512264e4603a08de57@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021/08/04 5:24, Andrew Morton wrote:
> Thanks.  I'm suspecting "Add mmap_assert_locked() annotations to
> find_vma*()" found an error in Tomoyo - tomoyo_dump_page() should be
> holding mmap_lock?

Yes, TOMOYO needs the same protection which get_arg_page() needs.
Please fold below diff into "mm/pagemap: add mmap_assert_locked() annotations to find_vma*()".

diff --git a/fs/exec.c b/fs/exec.c
index 816c7e347c9c..c982de69fab9 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -214,8 +214,7 @@ static struct page *get_arg_page(struct linux_binprm *bprm, unsigned long pos,
 		gup_flags |= FOLL_WRITE;
 
 	/*
-	 * We are doing an exec().  'current' is the process
-	 * doing the exec and bprm->mm is the new process's mm.
+	 * We are doing an exec(). bprm->mm is the new process's mm.
 	 */
 	mmap_read_lock(bprm->mm);
 	ret = get_user_pages_remote(bprm->mm, pos, 1, gup_flags,
diff --git a/security/tomoyo/domain.c b/security/tomoyo/domain.c
index 98d985895ec8..31af29f669d2 100644
--- a/security/tomoyo/domain.c
+++ b/security/tomoyo/domain.c
@@ -897,6 +897,9 @@ bool tomoyo_dump_page(struct linux_binprm *bprm, unsigned long pos,
 		      struct tomoyo_page_dump *dump)
 {
 	struct page *page;
+#ifdef CONFIG_MMU
+	int ret;
+#endif
 
 	/* dump->data is released by tomoyo_find_next_domain(). */
 	if (!dump->data) {
@@ -909,11 +912,13 @@ bool tomoyo_dump_page(struct linux_binprm *bprm, unsigned long pos,
 	/*
 	 * This is called at execve() time in order to dig around
 	 * in the argv/environment of the new proceess
-	 * (represented by bprm).  'current' is the process doing
-	 * the execve().
+	 * (represented by bprm).
 	 */
-	if (get_user_pages_remote(bprm->mm, pos, 1,
-				FOLL_FORCE, &page, NULL, NULL) <= 0)
+	mmap_read_lock(bprm->mm);
+	ret = get_user_pages_remote(bprm->mm, pos, 1,
+				    FOLL_FORCE, &page, NULL, NULL);
+	mmap_read_unlock(bprm->mm);
+	if (ret <= 0)
 		return false;
 #else
 	page = bprm->page[pos / PAGE_SIZE];
