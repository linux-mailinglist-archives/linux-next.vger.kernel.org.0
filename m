Return-Path: <linux-next+bounces-4650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D09BFFBF
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 09:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3606AB21609
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DA51D3644;
	Thu,  7 Nov 2024 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W9gW9hrw"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAC192B73
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967189; cv=none; b=EEUmZwJGy6EAPjKlMSxZOZGFAJA6z4FWPVpHROm6rWlwMKan2Ax38YeHmatKFUAcE6KK1TtFlwKCtogOt+SQpvYGu2KimYMpk1LCrkNSZwoChgjmQL500CpXVNDv5Iz7ZQSFiiylNi2AUxuY0ORW0067JZcM1gN2b3viwrBAbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967189; c=relaxed/simple;
	bh=jmcE0/Im3Exsi4Vo2GDudQkmOHMoQVfMs6ELkDnlnJM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BThzTgLSdD9PFQjJHUqfB8ddzcox8hNfaf6GZhqR2Uh6ZdBDNtvlu4kbiDiY73UZk7yNmVh1MJcAQ2YYP+hIIuPir1TvkbWyi11wgHl6XyqsHh/h5JMFYWcssO9jqURT5b1zNj5hEhDmaplx6KquF7AwoiFvMlur5auVOkwk4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W9gW9hrw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730967185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmcE0/Im3Exsi4Vo2GDudQkmOHMoQVfMs6ELkDnlnJM=;
	b=W9gW9hrwEm8zBjWwAH8vIr42lQDl66dgTetgf6SO2DkQqPzdWg0hDo4q5QkjXQ5VFMe0/T
	+QYQ8Recg0cQ3sQ6R8UqTnRZ5xEipdksyLdqOgxPLJ4czlrc07QR5arnTvxT2105tZjq+L
	99ZmGmKc+mhhmjZOm6jXUs0LEQsHFIM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-li3153aROT6UutJMG3Dg-Q-1; Thu, 07 Nov 2024 03:13:04 -0500
X-MC-Unique: li3153aROT6UutJMG3Dg-Q-1
X-Mimecast-MFC-AGG-ID: li3153aROT6UutJMG3Dg-Q
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43159c07193so6482895e9.0
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2024 00:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730967183; x=1731571983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmcE0/Im3Exsi4Vo2GDudQkmOHMoQVfMs6ELkDnlnJM=;
        b=L4PMgIXdHflQkKX8dsy7gcTfWYiQKzG/RelKPzb/oiNtqAcVezysE9hVL3y5WzUWKE
         DOpZEIkC/dbeakhI6w39U1CO2K4YCyWwZMLrr2K92AQ2u0RDicvqllroIQ9uSGNGda84
         ZAZ692UC2VDPrC3XTSHp8VGvU6f5s0piwsfDOAOSY4UZ35cI8Q7Elfvbfg4t/NSRH7TK
         6TfgmcJGWR4/7ni3XHKPUedS6hFBV1Hmf5ic1xL1joRVWS/JpWdkL415xx+kQy4xREjm
         nvDqNkNeYkvUA+tDuMBTXHhdM7z1PtgsF3N69udJEj40lWLVWysMgZNkA7uvP0Y+Xw7/
         FFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8g9ZAH6jnxQg2ZFkn26rsldufBGrye4PnvZY2zYTDSsTCoCCAXDjlLJeGgXIYC564+NF4RTEKYNGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaMNy/u6c7K0fD97Nee4lx43PjitfUvtfIHJ2zMRLQNIkyKXe
	tCmSV8CvqmDWUW8ArknAKaJFDG/v9yppeu9jCTI92znGt5ML4IatE9W1C77U7mvKf2NXaD7U4s5
	3+aocSRqRmYLhMYRrvst4T9BJ5REj+6BkZSAJJBlWNakMsSQO7vV84VVBQcU=
X-Received: by 2002:a05:600c:4683:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432942dd802mr176881185e9.3.1730967182977;
        Thu, 07 Nov 2024 00:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnTyA6N8yEcFnDtKauiq42cuS9o+PXrZ70fr1HF81Ts+ix5HQLYe878DBn81fWa9Uq4qScrg==
X-Received: by 2002:a05:600c:4683:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432942dd802mr176881025e9.3.1730967182667;
        Thu, 07 Nov 2024 00:13:02 -0800 (PST)
Received: from [10.32.64.113] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0566544sm14009185e9.24.2024.11.07.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 00:13:02 -0800 (PST)
Message-ID: <71860affadbd3efe72edbced28b3135924a28594.camel@redhat.com>
Subject: Re: linux-next: manual merge of the block tree with the pci tree
From: Philipp Stanner <pstanner@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Thu, 07 Nov 2024 09:13:00 +0100
In-Reply-To: <20241107162459.71e0288a@canb.auug.org.au>
References: <20241107162459.71e0288a@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-11-07 at 16:24 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the block tree got a conflict in:
>=20
> =C2=A0 drivers/block/mtip32xx/mtip32xx.c
>=20
> between commit:
>=20
> =C2=A0 5080394a8fcb ("block: mtip32xx: Replace deprecated PCI functions")
>=20
> from the pci tree and commit:
>=20
> =C2=A0 91ff97a72259 ("mtip32xx: Replace deprecated PCI functions")
>=20
> from the block tree.

Ooops, that should not have happened =E2=80=93 I must have lost overview ov=
er
my branches when submitting the latter.

I will improve quality ensurence.

>=20
> I fixed it up (I arbitraryly used the former version) and can carry
> the
> fix as necessary. This is now fixed as far as linux-next is
> concerned,

Thanks. I think dropping the latter is the right thing to do.

Regards,
Philipp

> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.=C2=A0 You may also
> want
> to consider cooperating with the maintainer of the conflicting tree
> to
> minimise any particularly complex conflicts.
>=20


