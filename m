Return-Path: <linux-next+bounces-4268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E729A99DF25
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 09:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A672D2834E7
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 07:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A635916CD1D;
	Tue, 15 Oct 2024 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WhBr4Z3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KDmLUxXz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WhBr4Z3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KDmLUxXz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EA09474;
	Tue, 15 Oct 2024 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728976523; cv=none; b=RLzPjU9APhDRcxsp3HPV65GkMH0ZMQW9/4gyKjbsgqInNVk4BY7abf026Vub9xWjOAGK4Fv/QX81m7GgjzCbzr6k7TGk2Ybkw1pM0H22cVkjwSBevsNRw6Fm5f17/FR1iOPJa0ljI0IEwnaUn8ICjBiBL3sg+FX8Na5GkbVDeq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728976523; c=relaxed/simple;
	bh=Rh4vDfFnErtcwj2KDySIjEAn31H97tCrOAltkmY6ssc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mf3HqnMkQCW+vKmaI9dSKLpvNABn86ToQIH33hGXOWQOE4235n+RZJtOlXITMlYyiUgA54r+g9s9FwFJuy/p0L1jlSiZrf9Bt7sMavAk7f3/7AS5VS4pZdqI3km6CLcGecnVM207pQ5jIp2MHJblurPGdHtwzH7WTYWqKkS3Vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WhBr4Z3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KDmLUxXz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WhBr4Z3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KDmLUxXz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2008F21E4E;
	Tue, 15 Oct 2024 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728976520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ECBV7/4rMkBDqb6FsJM7XT94R1az118+cUHap56/Mpg=;
	b=WhBr4Z3YxQ003aHraQdYSGaaB++FqhtTa9RJCBLNYsTuOy1VqnGhSVUmmveYp38gcfZGs6
	p3Mnd/rQifIs3D6hP7G/35dto4xxW0ELvW+apAx6Zv2X/DLU6oCVfsvgmkplFeR4w2vGYN
	2RFdsdZ7bAlWN7XnsvAh3TlncH4RhfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728976520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ECBV7/4rMkBDqb6FsJM7XT94R1az118+cUHap56/Mpg=;
	b=KDmLUxXzE+ti24WoYdYxA+B4EyvCZz+7gT5QqH/5wnMPH9eR+Jx8LRAZQG1tHmXaCWyHMe
	0TPrkmk3SOyNKJDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WhBr4Z3Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KDmLUxXz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728976520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ECBV7/4rMkBDqb6FsJM7XT94R1az118+cUHap56/Mpg=;
	b=WhBr4Z3YxQ003aHraQdYSGaaB++FqhtTa9RJCBLNYsTuOy1VqnGhSVUmmveYp38gcfZGs6
	p3Mnd/rQifIs3D6hP7G/35dto4xxW0ELvW+apAx6Zv2X/DLU6oCVfsvgmkplFeR4w2vGYN
	2RFdsdZ7bAlWN7XnsvAh3TlncH4RhfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728976520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ECBV7/4rMkBDqb6FsJM7XT94R1az118+cUHap56/Mpg=;
	b=KDmLUxXzE+ti24WoYdYxA+B4EyvCZz+7gT5QqH/5wnMPH9eR+Jx8LRAZQG1tHmXaCWyHMe
	0TPrkmk3SOyNKJDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9BA713A42;
	Tue, 15 Oct 2024 07:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FVSVN4cWDmf6dwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Oct 2024 07:15:19 +0000
Message-ID: <7df614b3-4b6c-490a-b64b-ceabf7d2d290@suse.de>
Date: Tue, 15 Oct 2024 09:15:19 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fbdev tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Helge Deller <deller@gmx.de>
Cc: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241015120119.533e65e8@canb.auug.org.au>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20241015120119.533e65e8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2008F21E4E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[canb.auug.org.au,gmx.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Hi

Am 15.10.24 um 03:01 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the fbdev tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/video/fbdev/sstfb.c: In function 'sstfb_probe':
> drivers/video/fbdev/sstfb.c:1439:2: error: invalid preprocessing directive #fdef; did you mean #ifdef?
>   1439 | #fdef CONFIG_FB_DEVICE
>        |  ^~~~
>        |  ifdef
> drivers/video/fbdev/sstfb.c:1442:2: error: #endif without #if
>   1442 | #endif
>        |  ^~~~~
>
> Caused by commit
>
>    7c0510bb3452 ("fbdev: sstfb: Make CONFIG_FB_DEVICE optional")
>
> I have used the fbdev tree from next-20241014 for today.

Thanks for reporting. While it has my r-b, it wasn't supposed to be 
merged yet. I sent out a fix to address the remaining problems. See

https://lore.kernel.org/linux-fbdev/20241015071029.25639-1-tzimmermann@suse.de/T/#u

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


