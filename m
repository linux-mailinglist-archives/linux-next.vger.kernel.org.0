Return-Path: <linux-next+bounces-9474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8ECCDFAA
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 00:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22FD73029C20
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 23:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E192FFF94;
	Thu, 18 Dec 2025 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f5DF9gb1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KQrhv7gy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M2hdylPB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jn4jQJg1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F852D2394
	for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766101214; cv=none; b=X2ggdbbdDfoKgghhomtu44WTiaiRXVrJcBbgl5gcDk5aAHu/G7ingsy27FqBSuXgbdI6VDGg7eRIWFE3kk2P48JwSDS11/G5IHl/716OXQu7rU9f0LTsAucSopC0PUP8vA/YAlLBfqMLxdUoFD/H/HcTzDtO2wIrj725+YXfjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766101214; c=relaxed/simple;
	bh=Qc05eq/qTA7bQPgn4gOMjkLEvXpHx2xtxF+B9Kbb7sg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gn6xsBI8uJl3540l5HScCQ/9LEYNYqpCMXyD6Kllu6r1vCYBU2jIp5SgsVQFBpowe6iJk8LX49er2KJe0/LQsw3/YZYJc2aPx10RCxMubNKfl92jcbz9Sjax+/Q3sHj2fOR0Ls/PsjFZIJXxT7Lve9397LmjQQNdOd/Wz9gQfkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f5DF9gb1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KQrhv7gy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M2hdylPB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jn4jQJg1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A55D55BD40;
	Thu, 18 Dec 2025 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766101209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EaHC8xg05++ZrWexMIdlwDaLfeHpjA+Zapu+64QVK8k=;
	b=f5DF9gb1m27DV+4ZwY9YSV7GMhqZ4DS6GLEgTcwncyV4K7dG12+KlGrgjh6tlSBdItLpiB
	ZsPExpYT2Cw7H1ltjXoPyZSIg+vLGp1uTK9U185B9wdjMlUzDxmUOfkVdoNfRWBJiutQHl
	9iusmnBwJCiBYBCiYNOrWi9yDejffuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766101209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EaHC8xg05++ZrWexMIdlwDaLfeHpjA+Zapu+64QVK8k=;
	b=KQrhv7gyVVllbEr4OjyFet4pwnVn3yynSsdDBx1g/6G7MfmH+WcytZn/KDPcXQA8e+hPfo
	QDEim5Ww4T5gPSBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M2hdylPB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jn4jQJg1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766101208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EaHC8xg05++ZrWexMIdlwDaLfeHpjA+Zapu+64QVK8k=;
	b=M2hdylPBLW3lPoOfow6lMC4a1GL0Ihtkl+mdX8GZ3uBzQB4UNjL/sO0+A9jDtB7hS7feeI
	OYA+QZ19wYzxuoj3KDJd5XDWWAc0Oi+j3ISsWcOblH1UvAp25J9ydpZHH3XwAw1hdRyyI5
	nqLtPJyiNAmcDL2AUa60Fdq8E20+v1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766101208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EaHC8xg05++ZrWexMIdlwDaLfeHpjA+Zapu+64QVK8k=;
	b=jn4jQJg1YihT2Ftw5E+B/IZcyMYpcYasIzS+iezvefStrg61n0XlvX4LvvuWx1BEHNOZWF
	JsFsd/c8h/nyLWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EBD43EA63;
	Thu, 18 Dec 2025 23:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AmV/DNiQRGmBfAAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 18 Dec 2025 23:40:08 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,  Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,  Andreas Larsson
 <andreas@gaisler.com>,  Christoph Lameter <cl@linux-foundation.org>,
  Chuck Lever <chuck.lever@oracle.com>,  Dennis Zhou <dennis@kernel.org>,
  Dipen Patel <dipenp@nvidia.com>,  Gabriel Krisman Bertazi
 <krisman@collabora.com>,  Ingo Molnar <mingo@kernel.org>,  Jean Delvare
 <jdelvare@suse.de>,  Lee Jones <lee@kernel.org>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Matthew Wilcox <willy@infradead.org>,  Miguel
 Ojeda <ojeda@kernel.org>,  Oded Gabbay <ogabbay@kernel.org>,  Steven
 Rostedt <rostedt@goodmis.org>,  Tejun Heo <tj@kernel.org>,  Tyler Hicks
 <code@tyhicks.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au> (Stephen Rothwell's
	message of "Mon, 15 Dec 2025 18:41:26 +1100")
References: <20251215184126.39dae2c7@canb.auug.org.au>
Date: Thu, 18 Dec 2025 18:40:06 -0500
Message-ID: <87zf7f4aw9.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: A55D55BD40
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> unicode			2024-10-11 15:02:41 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#for-next

Please, preserve it.  There is not much work going on in fs/unicode, but
occasionally there is a fix and it needs to be in linux-next before
reaching Linus.

-- 
Gabriel Krisman Bertazi

