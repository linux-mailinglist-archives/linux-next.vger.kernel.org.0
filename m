Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA164E75BB
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 17:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390762AbfJ1QC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 12:02:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26199 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731519AbfJ1QC1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 12:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572278546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CFA3UR5epXPZ3Q+P89ar8BSxRkGTnC0ptnFKZThT7Yg=;
        b=ITdmLhs/KYsuixH1RtA4f1kIe13tUtFSzMIj3Kzmn1LgZSlq7s/aIq735ZwhYMHLQFReBg
        3KP/uwpCKCEy5WCG6nHSqwZG0uMDZJ9Ft4UorZ3cjGLiEaDmkt8T/3I3udGQH04EWW9o8O
        tD3SmN6vVj/HuEEv8g1gkJtD2YE7T8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Wg_rjzE3NdiicPaLXu_-kA-1; Mon, 28 Oct 2019 12:02:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E86801E64;
        Mon, 28 Oct 2019 16:02:18 +0000 (UTC)
Received: from treble (ovpn-121-225.rdu2.redhat.com [10.10.121.225])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5AF600C9;
        Mon, 28 Oct 2019 16:02:17 +0000 (UTC)
Date:   Mon, 28 Oct 2019 11:02:15 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Oct 28 (objtool)
Message-ID: <20191028160215.ruzhvlwqaumw4krm@treble>
References: <20191028195154.4b6651dd@canb.auug.org.au>
 <b7c7bb28-1810-88e5-1899-a90123d26627@infradead.org>
MIME-Version: 1.0
In-Reply-To: <b7c7bb28-1810-88e5-1899-a90123d26627@infradead.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Wg_rjzE3NdiicPaLXu_-kA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 28, 2019 at 08:31:28AM -0700, Randy Dunlap wrote:
> On 10/28/19 1:51 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20191025:
> >=20
>=20
>=20
> on x86_64:
>=20
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable=
 instruction
>=20
> .o file is attached.

Silly GCC.  Does this fix it?

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 4b1c3b664f51..d58587391b96 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -83,7 +83,7 @@ static inline void exit_thread(struct task_struct *tsk)
 {
 }
 #endif
-extern void do_group_exit(int);
+extern void __noreturn do_group_exit(int);
=20
 extern void exit_files(struct task_struct *);
 extern void exit_itimers(struct signal_struct *);
diff --git a/kernel/exit.c b/kernel/exit.c
index f2d20ab74422..bdc4122d904d 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -894,7 +894,7 @@ SYSCALL_DEFINE1(exit, int, error_code)
  * Take down every thread in the group.  This is called by fatal signals
  * as well as by sys_exit_group (below).
  */
-void
+void __noreturn
 do_group_exit(int exit_code)
 {
 =09struct signal_struct *sig =3D current->signal;
@@ -931,7 +931,6 @@ SYSCALL_DEFINE1(exit_group, int, error_code)
 {
 =09do_group_exit((error_code & 0xff) << 8);
 =09/* NOTREACHED */
-=09return 0;
 }
=20
 struct waitid_info {
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 543c068096b1..97919469c787 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -135,6 +135,7 @@ static bool __dead_end_function(struct objtool_file *fi=
le, struct symbol *func,
 =09=09"__stack_chk_fail",
 =09=09"panic",
 =09=09"do_exit",
+=09=09"do_group_exit",
 =09=09"do_task_dead",
 =09=09"__module_put_and_exit",
 =09=09"complete_and_exit",

