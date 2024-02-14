Return-Path: <linux-next+bounces-1173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4901855318
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 20:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6BDEB21FDA
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 19:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5039613A86D;
	Wed, 14 Feb 2024 19:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0B+IViH"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679813A86A
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707938373; cv=none; b=UCBhlscyRfFRjccWkhpRYQqgea4qSoFy+rwvR1V0HP0DG7VNKTRI3mWNuFEfKnLsY/Nyg/i/Vmi5iCJ1jOlpJnkVjc8xAgZyGkBxPo+2NnSNQ9ZsQvcJ8WCWwJA+x/TWkWGzMuY3wTLhnPoW2T7XAlf9ifbO9QBkfrzppl7/aCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707938373; c=relaxed/simple;
	bh=WddP6Rm3FHbSkDJ/3e61+m5VRjT87hVk4bJfICjjttk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7He37109uvhn4K5cgaQdTG7yeQkHemjz66qZOSJJrMt+zUbC4PJB/2+62vA8ss31YDmc+WNySDrjKjeZvKOVIqDEL0ExcUmGfJkNXNoQzhKnIG81I19ccTUKPwNsZnDWPc+rZpR3M3TsXCQ8ZnkOK0omOOvMV9gyEo1QgqoWrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0B+IViH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707938370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WddP6Rm3FHbSkDJ/3e61+m5VRjT87hVk4bJfICjjttk=;
	b=c0B+IViH8Hfkwuozt7H7Kfa+Ky5ITrSIz4ojF95UMAtxr6M1EUVqqXHf1afcKLclUPYbzS
	5w18KuSX35wRGDP0L+Mt1Gsggiaroa2rhU4tafZdnmdQOpcXFh4qtPS3iSu8BeRe49hNq0
	2NAbqwEF74MvleP4gwEAdvIUmYzXCWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-TE08d_v-OtOUaL93Si5HLQ-1; Wed, 14 Feb 2024 14:19:25 -0500
X-MC-Unique: TE08d_v-OtOUaL93Si5HLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1B3C828CE3;
	Wed, 14 Feb 2024 19:19:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.126])
	by smtp.corp.redhat.com (Postfix) with SMTP id 544DA8CED;
	Wed, 14 Feb 2024 19:19:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 14 Feb 2024 20:18:07 +0100 (CET)
Date: Wed, 14 Feb 2024 20:18:01 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Tycho Andersen <tycho@tycho.pizza>
Cc: coverity-bot <keescook@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Tycho Andersen <tandersen@netflix.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: __do_sys_pidfd_send_signal(): UNINIT
Message-ID: <20240214191801.GA27799@redhat.com>
References: <202402131559.B76A34B@keescook>
 <ZcwGua3a9Z8nJXVq@tycho.pizza>
 <20240214090332.GA14017@redhat.com>
 <20240214090640.GB14017@redhat.com>
 <ZczLyDCN+zG6imTd@tycho.pizza>
 <20240214175555.GC16265@redhat.com>
 <Zc0Ca5te+QFBZ1U6@tycho.pizza>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc0Ca5te+QFBZ1U6@tycho.pizza>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On 02/14, Tycho Andersen wrote:
>
> On Wed, Feb 14, 2024 at 06:55:55PM +0100, Oleg Nesterov wrote:
> >
> > We want to check the "flags" argument at the start, we do not want to
> > delay the "case 0:" check until we have f.file (so that we can check
> > f.file->f_flags).
>
> Fair point. I was thinking delaying it would make it simpler, but then
> you have to free the file and it's less fast in the EINVAL case.

plus we do not want to return, say, -EBADF if the "flags" argument is wrong.

> I also don't have a strong opinion here.

Neither me.

Oleg.


