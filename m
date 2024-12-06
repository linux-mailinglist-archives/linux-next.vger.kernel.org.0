Return-Path: <linux-next+bounces-4888-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B619E7138
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 15:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17FD2281F34
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC82F1442E8;
	Fri,  6 Dec 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBNJ7wB2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC021494B2
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496784; cv=none; b=TR7y0CcRSAwrJulytRX0nZH2YkJ7q1KXvDii5h48S2VxbbpCFRehDe6R1fVz919jL89vCfD8o3BsNqd3FCVnpF8BsaCTvZ9vrGQSolh0fOevpsmK/IyB3J49LBAeoiN9YtSIHoplZZ1KcFh/WrF0HVVnxN/vwqaz78O57Yr+dYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496784; c=relaxed/simple;
	bh=GIvncnLl2zDE7vGYV3XljGaHoaqc0ntuyVF7cTSz3Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obEBya1rkMjCCUkfAN5Al1CcBmHO2KiIek87mR73UzYGgovQlndRgLxNo0e434fOO5UtLSM0QVurMP6ibBNw/1daKc55hcuuCoRO6cBsAizSX9mGPtdgTCc4ocg+jkU/NrLFtlbc2tdsf3ffdzfPReIct3PKruad7eKNN7cCmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBNJ7wB2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso420356866b.3
        for <linux-next@vger.kernel.org>; Fri, 06 Dec 2024 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733496781; x=1734101581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jB0YUjM4YjcNmK65uJIs3x8AoTxxrdNm5KZgnfqmxE=;
        b=cBNJ7wB2LqwYzRmsXIENHgkfl5KHJjy6v18LxGdglNj94C2PticmYmd8i5L6ud7a9X
         KS7zC7brvEZHAk2Z31/rZ1lQ3F15kGz/9FgUSnhA2uap4OodiBQQwGkj0NXD1mz33HDc
         0SGo+/QxeUfSqDWpl1oUHzh6Vqpia4gry97cVQ3e+9YvOAn8EOq7oAU4gxK9XoJpG9rE
         Xf1voj6UUIKp//4CKHt2Ihxa8l6B2fZIfVj1NMcpzv6Hd3gchSe80N3LaAv0PLeGG0Kc
         XHv9EoouWIYTbvydSy7sSwv3HEmovCFMov6vj0/8q0YBIkRRr36mbIN2kApiUqAWahKd
         o3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733496781; x=1734101581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jB0YUjM4YjcNmK65uJIs3x8AoTxxrdNm5KZgnfqmxE=;
        b=mKuVjjxwrmAg4MuS5ySai4tGccA8rvt6cszhFMV9KehtL8hdxt8dwJXIA3cPYkOUPb
         9KM2Ep+ibcpbawgncNFtngMC4AzSu1AZqFTEEqnvzHMViWvwwcXhYGGwOOUPptRzIFV0
         nXTuo9qm2J6IOK7PFUwmYFu21BPOlZ0L8CWKSmvfXmf/AmHviBqvbJS7vNyXAKZ+wg7q
         re2THNfJKfOyAq1VHKTpW1im8028xySWPLrzI10wOoEtYZeJ0jLg7LwBHR9feva56W4x
         T7GDXfsetvSm9UAemKNpJ8RvBn8Fa0MrSD38hZshDrQl7bxEXZIoEtlDtA2UYWwE7nI5
         7NfA==
X-Forwarded-Encrypted: i=1; AJvYcCUOFqBjDHgK43m8MNdTF9vt3SpQ9VFO4bPN8n68CBZFM/gi8iOXp6iBLU/KFTUyJ03zpHwCPsCE2K0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoE1mZBjMfU1mfsJKIRvkXckLoAL2ijCzP1wal7lBGDRtA9j2
	UFYBCmVBd9Ky9gHHd4LRY3Hm6Xqztd4czBjdGwQVI4zb1AN0AX1O6xK34IlvUhy7MrQyFiEUsxm
	WymgyJpaAal0lUHt+bLV98NqBO84=
X-Gm-Gg: ASbGncux7uTI3V2E+k7zIavTGgU/NksaHQuKkLPiKeO3Dd1T+dGacRVIdntZb5CYyw9
	evF7sx7rwAeMmYao06G2tXtvdSLEZMto=
X-Google-Smtp-Source: AGHT+IFVHpuJc4MKjhmK85sGXObR14vyRhuHs5b3tMSretZ92IV6XwNX4bImzes4IIaXE7vOoNjb6nDXBZcMdghYn6I=
X-Received: by 2002:a17:907:a184:b0:aa6:194a:697d with SMTP id
 a640c23a62f3a-aa63a07e6a6mr312620166b.25.1733496780910; Fri, 06 Dec 2024
 06:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk> <20241206144606.eltwdm6srrhlplss@quack3>
In-Reply-To: <20241206144606.eltwdm6srrhlplss@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 6 Dec 2024 15:52:49 +0100
Message-ID: <CAOQ4uxij2yMrhT+Vs-raa+p9jO_P68gYztoRLuGAg2eCMha6Pg@mail.gmail.com>
Subject: Re: Missing signoffs in the ext3 tree
To: Jan Kara <jack@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 3:46=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> Hi!
>
> On Fri 06-12-24 10:22:31, Mark Brown wrote:
> > Commits
> >
> >   74094f677916e ("fanotify: don't skip extra event info if no info_mode=
 is set")
> >   8adc64d022177 ("fs: get rid of __FMODE_NONOTIFY kludge")
>
> Thanks for noticing Mark.
>
> Al, care to provide your signed-off-by for the
> "fs: get rid of __FMODE_NONOTIFY kludge"? Amir then massaged the details
> but you were indeed the original author of big part of the patch. Thanks!
>
> Amir, I'm not sure about the authorship of "fanotify: don't skip extra
> event info if no info_mode is set". Was it you or actually Josef?

I do not know if I sent out a sketch, but looks like Josef was the
author of the patch in its current form:
https://lore.kernel.org/linux-fsdevel/adfd31f369528c9958922d901fbe8eba48dfe=
496.1721403041.git.josef@toxicpanda.com/
we passed the branch back and forth so many times that I might have
changed authorship by mistake,
so best fix authorship.

Thanks,
Amir.

