Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC49B1CF259
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgELK2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:28:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57276 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgELK2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 06:28:49 -0400
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jYS9X-0006TO-0M; Tue, 12 May 2020 10:28:47 +0000
Date:   Tue, 12 May 2020 12:28:46 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pidfd tree
Message-ID: <20200512102846.alrmccyzou5rymnq@wittgenstein>
References: <20200512201811.12480da0@canb.auug.org.au>
 <20200512102024.f7sycax5qzvxay7t@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200512102024.f7sycax5qzvxay7t@wittgenstein>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 12:20:24PM +0200, Christian Brauner wrote:
> On Tue, May 12, 2020 at 08:18:11PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the pidfd tree, today's linux-next build (x86_64
> > allnoconfig) failed like this:
> > 
> > fs/nsfs.c:232:6: error: redefinition of 'proc_ns_file'
> >   232 | bool proc_ns_file(const struct file *file)
> >       |      ^~~~~~~~~~~~
> > In file included from fs/nsfs.c:6:
> > include/linux/proc_fs.h:194:20: note: previous definition of 'proc_ns_file' was here
> >   194 | static inline bool proc_ns_file(const struct file *file)
> >       |                    ^~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   1e76b8ad203a ("nsproxy: attach to namespaces via pidfds")
> > 
> > I have applied the following hack for today:
> 
> Thanks for spotting this. I'll fix this now.

diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index acfd5012db4e..592a6e47b235 100644
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -70,7 +70,7 @@ struct proc_dir_entry *proc_create_single_data(const char *name, umode_t mode,
                int (*show)(struct seq_file *, void *), void *data);
 #define proc_create_single(name, mode, parent, show) \
        proc_create_single_data(name, mode, parent, show, NULL)
-
+
 extern struct proc_dir_entry *proc_create_data(const char *, umode_t,
                                               struct proc_dir_entry *,
                                               const struct proc_ops *,
@@ -104,7 +104,6 @@ struct proc_dir_entry *proc_create_net_single_write(const char *name, umode_t mo
                                                    proc_write_t write,
                                                    void *data);
 extern struct pid *tgid_pidfd_to_pid(const struct file *file);
-extern bool proc_ns_file(const struct file *file);

 #ifdef CONFIG_PROC_PID_ARCH_STATUS
 /*
@@ -160,11 +159,6 @@ static inline struct pid *tgid_pidfd_to_pid(const struct file *file)
        return ERR_PTR(-EBADF);
 }

-static inline bool proc_ns_file(const struct file *file)
-{
-       return false;
-}
-
 #endif /* CONFIG_PROC_FS */

 struct net;
@@ -185,4 +179,6 @@ static inline struct pid_namespace *proc_pid_ns(const struct inode *inode)
        return inode->i_sb->s_fs_info;
 }

+bool proc_ns_file(const struct file *file);
+
 #endif /* _LINUX_PROC_FS_H */

should fix it cleanly.

Thanks, I've added an allnoconfig to my local tests now!

Christian
