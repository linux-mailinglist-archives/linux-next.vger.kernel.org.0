Return-Path: <linux-next+bounces-3272-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E094CA57
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 08:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211FF1F2269E
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 06:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC32433A8;
	Fri,  9 Aug 2024 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5tO+PfK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5203D6D;
	Fri,  9 Aug 2024 06:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723184308; cv=none; b=SBLyNlg1LAE39umk+kACx95i2VXT2dzYm9p2Aot8GbsPNmLekSB/D9I+3Vi2TQFnzp9C4G4eqDUmLYRSZNbW6t4I0TnLfxFB5F7VRXXgH/w9Z1SnDMM63KOg+0qnhxbdiC2l2jd6FaoyCS7jVC9vXwpZn6ySddhJhC5AQhnpczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723184308; c=relaxed/simple;
	bh=WipezWcI//xYmmLN8Yphu7qOaIJXxVnkcsxNoQPM6x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifZ7VSFsolKynUopuUF7jh46UBeBLEj3QyZHBdLwDAEFN3Uj2O+2L+P7wUvumI3Z7ptztmhJDosUsBJME+3UhJo5GF65PK+6yE7fZVZzpsjnlhYdYn90PXnpdbUqNVIT/DA7/GWzdlu0UVlQyRcyJhFdh4w2WD+3nDKcGeNbSeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5tO+PfK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc60c3ead4so14423145ad.0;
        Thu, 08 Aug 2024 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723184306; x=1723789106; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn4xytyMtvgHJ5Ah2WfGo1ECfIMWfwDi1xDdj2h0uHk=;
        b=K5tO+PfKs3rI2gMRbK4QfsEhu1Dy22kIhZWE0Vgdcdp2mM00nfRc9gBDz3DG6/PGhT
         o6ILRQI2eDqMIpRdhn6l2oeDzV6zXZPgSG3wTxjnNr0LsJcgzfzUL4RucF0ajgGgo55B
         lD1tm5K1r0iWcw4e2ea1r5FcbKV+fK5Z/FUpdLySEL7msnotpzhi7SZo7cou0tqmd0Es
         OPFvcMtGgd0S4WYgcKlSi58mzGvNIIBNQuBakYIFXAmMhJBFDiT/wUxFNVVU79X2+bzb
         8kewePygaIIluWr3OSHmLw18oCb4y3nCpYZlqEEtloFgMvzy/RGSWS53JmRA4c1fH2/P
         v4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723184306; x=1723789106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn4xytyMtvgHJ5Ah2WfGo1ECfIMWfwDi1xDdj2h0uHk=;
        b=iwPhEPB19+6aTn6htqZOQ6qyId0FHE+auRkn+0VR10oyqFaMNiAY6OnFOAszEY85WK
         /ndxN0BYnBeX575vtTMtPiQOzhsPpnVQZWVszeyPZxkFfy19KS4dv746gcBTGAvwrPKI
         jZqf/Tb98yIoPC6bXpJIQFUc/SwGcuOtNsXa2h2K3qrBQYmrDM9MYFHj3p6SSV5kefVH
         PtsS9Vl+YYVTOBaRgTZ8xvyrdEajal0gApCizQ7ndEE+hXPmQXwPaqOFPFQ8XCBE7s//
         Wg3zZH4mtwLt6iAOvld0w+Ik9PhlrdvpyDDzqoXywMKT38puWxsNqJavnVY0tNE+SfyO
         6spw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Gs5oDERMxB+294HqMtNXK2kml1mfOYLWNzvR00zWod1hqY9XpU+Dp7qdHxo9/3LRk846AzFX0f5U7JPCY4sGLjUOY+0+AFJhTWbpPVYWgdZLLae6v0mVrTQ6gZ7gK8bhMV+UN+21vg==
X-Gm-Message-State: AOJu0YwEA0hjGWg+6lCV4Pyir8Lbp2BRh1fttJCcRGfugOGFkX6Lg5/c
	Mye9SDU5ElKkKY4x8EMsfjU76CULyimEKCmCfJf5O3wO5ZajDqCWATmX9Xl/u1wqRPTewQHIqrR
	DBTKdDl7GnyPfBA1F2X8cifiykgw=
X-Google-Smtp-Source: AGHT+IGobOCY4sksQzUL1iMUjBF00lClgU7TaPHu616ANKUsA5rAYdId/CoFbV4LDhwIe1O1tNiLzgag5lvAkeRfn9k=
X-Received: by 2002:a17:902:ecc3:b0:1fb:6b94:66ee with SMTP id
 d9443c01a7336-200ae55f2b4mr6620335ad.26.1723184305932; Thu, 08 Aug 2024
 23:18:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809142659.5fee6d52@canb.auug.org.au>
In-Reply-To: <20240809142659.5fee6d52@canb.auug.org.au>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Fri, 9 Aug 2024 14:18:14 +0800
Message-ID: <CALm+0cX+BywJPFu_KX4MDWDPG77cOTGMDrf9PkSP1-nDMd2Qxw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the rcu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> Hi all,
>
> After merging the rcu tree, today's linux-next build (htmldocs) produced
> these warnings:
>
> kernel/rcu/tasks.h:54: warning: Function parameter or struct member 'index' not described in 'rcu_tasks_percpu'
> kernel/rcu/tasks.h:127: warning: Function parameter or struct member 'rtpcp_array' not described in 'rcu_tasks'
>

Hello, Stephen Rothwell

Please apply it:

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 4e913e5ca737..52ee77516260 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -34,6 +34,7 @@ typedef void (*postgp_func_t)(struct rcu_tasks *rtp);
  * @rtp_blkd_tasks: List of tasks blocked as readers.
  * @rtp_exit_list: List of tasks in the latter portion of do_exit().
  * @cpu: CPU number corresponding to this entry.
+ * @index: index number corresponding to this entry in rtpcp_array.
  * @rtpp: Pointer to the rcu_tasks structure.
  */
 struct rcu_tasks_percpu {
@@ -77,6 +78,7 @@ struct rcu_tasks_percpu {
  * @call_func: This flavor's call_rcu()-equivalent function.
  * @wait_state: Task state for synchronous grace-period waits
(default TASK_UNINTERRUPTIBLE).
  * @rtpcpu: This flavor's rcu_tasks_percpu structure.
+ * @rtpcp_array: Pointer array of used to store rtpcpu pointer.
  * @percpu_enqueue_shift: Shift down CPU ID this much when enqueuing callbacks.
  * @percpu_enqueue_lim: Number of per-CPU callback queues in use for enqueuing.
  * @percpu_dequeue_lim: Number of per-CPU callback queues in use for dequeuing.

Thanks
Zqiang

> Introduced by commit
>
>   a79e0e72ffa6 ("rcu-tasks: Fix access non-existent percpu rtpcp variable in rcu_tasks_need_gpcb()")
>
> --
> Cheers,
> Stephen Rothwell

