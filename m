Return-Path: <linux-next+bounces-5656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF83A4FCDE
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 11:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7EDB1658CB
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41362222C1;
	Wed,  5 Mar 2025 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eihXWYMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Ox8Dgbr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eihXWYMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Ox8Dgbr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5BE221F1C
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172122; cv=none; b=qw1ut2BOs3mnGYwIklT+NSXg0pGSssnUGR63T7fAyP+wHz1aXvwQTEcJigxnA/2dseowWQ0VeTkqbtGv2hfSL+INPIqPRQrp/hboaX/jtCAYqsiJVKSQ9yJmgIYPmv3jZRij+2L2oXT5E6I2cd78EGmPz6f9Ku4/2UiumrVrj2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172122; c=relaxed/simple;
	bh=4Z26Vif/aLrAcH6THndljTALT5UsksrHmQWG/Qss53M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fa82CP3SbLp5ODvzi8XZNIOuD9dwIchfe/WPuG+Ycut0pGQ9+bJR2LzvR/d4e5lu7PoYSVOqJoUnOO30phJjyDLRKfIyuuj/gvlJIfszmf5bjLEQes2EuSUe2cWT2W5sy9EMMSDv/kAjESb/e59kAFxBcvMUGcZMvRnJbzHek4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eihXWYMQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Ox8Dgbr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eihXWYMQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Ox8Dgbr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 180DC21197;
	Wed,  5 Mar 2025 10:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741172119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoSrOB8+uoMpops6QDXFLLwXLeVYc8uZptIC6rmNHGE=;
	b=eihXWYMQE7yWm8Ckrn+PeKUx/zgLjBvONFy7DGM+U71y7Q0nbj5oXvftb5xMVHPXbR91bQ
	4R2axuuBf6+zFlTYyidLakugL1I4Nt4QDt7V0DP9p+BoznQl2+j1ltTrFgUVLTjM2U6/FF
	Qiwd20y7KEQJXnLmH1wV1e4vELCvbm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741172119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoSrOB8+uoMpops6QDXFLLwXLeVYc8uZptIC6rmNHGE=;
	b=3Ox8DgbrTHEeUZ8eTs8AKIcgxEWlTS6fISSh5oO8vD/e7JWExdYkDSYAEBw9+AtKYDG6st
	jRfGiSQq21XrlRAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741172119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoSrOB8+uoMpops6QDXFLLwXLeVYc8uZptIC6rmNHGE=;
	b=eihXWYMQE7yWm8Ckrn+PeKUx/zgLjBvONFy7DGM+U71y7Q0nbj5oXvftb5xMVHPXbR91bQ
	4R2axuuBf6+zFlTYyidLakugL1I4Nt4QDt7V0DP9p+BoznQl2+j1ltTrFgUVLTjM2U6/FF
	Qiwd20y7KEQJXnLmH1wV1e4vELCvbm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741172119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoSrOB8+uoMpops6QDXFLLwXLeVYc8uZptIC6rmNHGE=;
	b=3Ox8DgbrTHEeUZ8eTs8AKIcgxEWlTS6fISSh5oO8vD/e7JWExdYkDSYAEBw9+AtKYDG6st
	jRfGiSQq21XrlRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52A4513939;
	Wed,  5 Mar 2025 10:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oS3iApUtyGdjCQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 05 Mar 2025 10:55:17 +0000
Date: Wed, 5 Mar 2025 21:55:06 +1100
From: David Disseldorp <ddiss@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250305215506.1f34f920.ddiss@suse.de>
In-Reply-To: <20250305210702.66402528@canb.auug.org.au>
References: <20250305210702.66402528@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Hi Stephen,

On Wed, 5 Mar 2025 21:07:02 +1100, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x0 (section: .data) -> initramfs_test_extract (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x30 (section: .data) -> initramfs_test_fname_overrun (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x60 (section: .data) -> initramfs_test_data (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x90 (section: .data) -> initramfs_test_csum (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xc0 (section: .data) -> initramfs_test_hardlink (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xf0 (section: .data) -> initramfs_test_many (section: .init.text)
> 
> Introduced by commit
> 
>   b6736cfccb58 ("initramfs_test: kunit tests for initramfs unpacking")

The new warnings are being discussed in a thread at:
https://lore.kernel.org/linux-kselftest/20250305114701.28c0ee0b.ddiss@suse.de/T/#u

Thanks, David

