Return-Path: <linux-next+bounces-2536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9B9061B1
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 04:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DD321C210B8
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 02:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8793BBF2;
	Thu, 13 Jun 2024 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OoVAVAWn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A363D96D;
	Thu, 13 Jun 2024 02:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245303; cv=none; b=kZWUmVtyjGVVjZ0tPJIks6X7Iw+XTXU3xY2t9clc8dWfpZ4D82hZfI81zkvDfpYuhguK1/UQgpY+8hK5e1xZJopvB6iSRWy6WjPlxu1A82XTpcZCWYBekAh6lHUaNyoBGJeuME8Q7xcm6ArYkYi0BSZcbl5BkXFMmC5rg3bBgHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245303; c=relaxed/simple;
	bh=pL2+P6vsz1q1L9XIcxmwV5WdL5pw+YnjsyiJgh124Ec=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fMlreX33SL5IX3MbvxXXVueyPaNBudmCkf7eHlqOit86AE6r6nEo1r6Aczd41JtUyzELzc6rxhCf2xa73FLsqnor0wA87aJinNOxO8tLlWItGC4ZpFDvTklrF9GDsGAkw1Vg7aBnYIJqdvsQa8B7VpXi/v25ZDvlzIgjwtd7BCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OoVAVAWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4500BC116B1;
	Thu, 13 Jun 2024 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718245302;
	bh=pL2+P6vsz1q1L9XIcxmwV5WdL5pw+YnjsyiJgh124Ec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OoVAVAWn5kGsTQcogMXlM2bC4c4+xsQvFwXUPKhZAGzP+XUvfTbx9QrtzDwLCN79i
	 DDuZl+msUzXiG7yUPgN9ibqYJtPL6eF3vKwKMJJDpJDdl106i3YLn28Nk7NhRgjJGu
	 jjFDeqzpztJCToQ/W7qmCHVd2KVdDfrDpyVI2YFk=
Date: Wed, 12 Jun 2024 19:21:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-Id: <20240612192141.69896438b5f6e674e07d418e@linux-foundation.org>
In-Reply-To: <20240613104837.346519cc@canb.auug.org.au>
References: <20240613104837.346519cc@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Jun 2024 10:48:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patch):
> 
>   08ce6f724ce9 ("proc: Remove usage of the deprecated ida_simple_xx() API")
> 
> This is commit
> 
>   d92c9986e4db ("proc: remove usage of the deprecated ida_simple_xx() API")
> 
> in the mm-nonmm-unstable branch of the mm tree.

That's one patch from a three-patch series in a different tree.

Also,

hp2:/usr/src/mm> git log fs/proc/ | grep "Signed-off-by.*brauner" | wc -l  
22
hp2:/usr/src/mm> git log fs/proc/ | grep "Signed-off-by.*akpm" | wc -l 
1211

Christian, if procfs patches are to henceforth go via the vfs tree,
let's be a bit more organized about it?


