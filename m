Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17720FCAF7
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 17:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKNQnY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 11:43:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:43579 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfKNQnY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 11:43:24 -0500
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iVIDI-0000oJ-8r; Thu, 14 Nov 2019 16:43:20 +0000
Date:   Thu, 14 Nov 2019 17:43:19 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org
Subject: Re: linux-next: Tree for Nov 14
Message-ID: <20191114164318.vbtp32qgkjy4qmv7@wittgenstein>
References: <20111114144303.6ba32f099a9d10aed68fb872@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111114144303.6ba32f099a9d10aed68fb872@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 14, 2011 at 02:43:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The patch is still absent from kernel.org.
> 
> Changes since 20111111:
> 
> The m68knommu gained a conflict against the m68k tree.
> 
> The wireless-next tree gained a conflict against the wireless tree.
> 
> The pm tree lost its build failure but gained two others for which I
> reverted a commit and applied a patch.
> 
> I removed 3 patches from the akpm tree that have shown up elsewhere.

Hey Stephen,

Just a heads up that tomorrow two new patches will show up in the
pidfd's for-next branch that will introduce a minor merge conflict in
linux/uapi/sched.h with what's in current mainline.
The merge conflict can be resolved as shown below.

	Christian

diff --cc include/uapi/linux/sched.h
index 25b4fa00bad1,2e649cfa07f4..000000000000
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@@ -36,28 -39,38 +39,42 @@@
  #ifndef __ASSEMBLY__
  /**
   * struct clone_args - arguments for the clone3 syscall
-  * @flags:       Flags for the new process as listed above.
-  *               All flags are valid except for CSIGNAL and
-  *               CLONE_DETACHED.
-  * @pidfd:       If CLONE_PIDFD is set, a pidfd will be
-  *               returned in this argument.
-  * @child_tid:   If CLONE_CHILD_SETTID is set, the TID of the
-  *               child process will be returned in the child's
-  *               memory.
-  * @parent_tid:  If CLONE_PARENT_SETTID is set, the TID of
-  *               the child process will be returned in the
-  *               parent's memory.
-  * @exit_signal: The exit_signal the parent process will be
-  *               sent when the child exits.
-  * @stack:       Specify the location of the stack for the
-  *               child process.
-  *               Note, @stack is expected to point to the
-  *               lowest address. The stack direction will be
-  *               determined by the kernel and set up
-  *               appropriately based on @stack_size.
-  * @stack_size:  The size of the stack for the child process.
-  * @tls:         If CLONE_SETTLS is set, the tls descriptor
-  *               is set to tls.
+  * @flags:        Flags for the new process as listed above.
+  *                All flags are valid except for CSIGNAL and
+  *                CLONE_DETACHED.
+  * @pidfd:        If CLONE_PIDFD is set, a pidfd will be
+  *                returned in this argument.
+  * @child_tid:    If CLONE_CHILD_SETTID is set, the TID of the
+  *                child process will be returned in the child's
+  *                memory.
+  * @parent_tid:   If CLONE_PARENT_SETTID is set, the TID of
+  *                the child process will be returned in the
+  *                parent's memory.
+  * @exit_signal:  The exit_signal the parent process will be
+  *                sent when the child exits.
+  * @stack:        Specify the location of the stack for the
+  *                child process.
++ *                Note, @stack is expected to point to the
++ *                lowest address. The stack direction will be
++ *                determined by the kernel and set up
++ *                appropriately based on @stack_size.
+  * @stack_size:   The size of the stack for the child process.
+  * @tls:          If CLONE_SETTLS is set, the tls descriptor
+  *                is set to tls.
+  * @set_tid:      Pointer to an array of type *pid_t. The size
+  *                of the array is defined using @set_tid_size.
+  *                This array is used select PIDs/TIDs for newly
+  *                created processes. The first element in this
+  *                defines the PID in the most nested PID
+  *                namespace. Each additional element in the array
+  *                defines the PID in the parent PID namespace of
+  *                the original PID namespace. If the array has
+  *                less entries than the number of currently
+  *                nested PID namespaces only the PIDs in the
+  *                corresponding namespaces are set.
+  * @set_tid_size: This defines the size of the array referenced
+  *                in @set_tid. This cannot be larger than the
+  *                kernel's limit of nested PID namespaces.
   *
   * The structure is versioned by size and thus extensible.
   * New struct members must go at the end of the struct and
