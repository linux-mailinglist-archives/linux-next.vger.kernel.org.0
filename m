Return-Path: <linux-next+bounces-6955-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D8AC6148
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 07:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C86017F8EF
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3551F0E29;
	Wed, 28 May 2025 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fc9/iOU9"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0B1C84B2
	for <linux-next@vger.kernel.org>; Wed, 28 May 2025 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748410695; cv=none; b=cvUt7qBKdyQk6B/FaUO/XA3rwV66NKpCIIQOqvMYaO8sMeURABI/57cAf7p+EO8RhptWjiWxv8QYGf7e1gT79q/MstmgxwWSTiaeFDPjfXfX6U0NVsTapP11EkF5gmp5geFd/WXkcFx24eSIhv65Er5FOTZuSi7/xawr/E7ON48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748410695; c=relaxed/simple;
	bh=vtplRbHf5cYdnrsURj8lTuNjyZSxPZnaf6G/k5Uxyl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPc3PVKvgdp4BYj6A5g+QxAn6rWfpC/5EknMkpTB9CPtNYaG1z2MSTR2oVi6+Kh69HBXdWUcnsHJaJFdw+ns1UFXUcR/1ne1oLDOdCSnkrlv7U6fqQNV1osoTGnfIyX5jdjo5RBksJGP4b4nCwXNQUjsSNEwG6/u5uC6uv5myyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fc9/iOU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748410692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpKYH25qdwO20Qi6WljMpSm7CxKxO2i5GmgG2oMcQM=;
	b=Fc9/iOU9W8QrCuJlKFMt+OT4YnHlnq9RCqKTtB4H6Nb/o+5PrMpqqrucD38DCo9Srbu0XC
	W+f4IrhopIc2BEiKa7jsFUan5y7iRFRnDWfUPnJsspfFDEdb9XD7WgEvLeIXIuW076B9Bu
	kH89LJX2enR4h+yVhDWe/5r7LtDc4Mg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-OQ9vBVK5PMem0ieyOSQsiw-1; Wed, 28 May 2025 01:38:10 -0400
X-MC-Unique: OQ9vBVK5PMem0ieyOSQsiw-1
X-Mimecast-MFC-AGG-ID: OQ9vBVK5PMem0ieyOSQsiw_1748410689
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4d863ac97so1313569f8f.2
        for <linux-next@vger.kernel.org>; Tue, 27 May 2025 22:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410689; x=1749015489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGpKYH25qdwO20Qi6WljMpSm7CxKxO2i5GmgG2oMcQM=;
        b=TSCrS26jXplB9UDBYL+e1lCGbVGY/H5vxEQd+GQoNZ+5fYvDoCnIM8knwb1vUSxCFx
         IJ0/FS5iofIJd5141dARWkYLcueF2s3Axp8vJlkpxlyQ0dLgRT4e/02ArBMU5v4LJIpf
         rn7kepiPa0sTDFNsoHXP5giZhFzN05JnCvq9DlIqCX2GD0CDYxaPo41GnzfAMdhCs7jn
         /ERNsG15WLwnL+FxK/hHCsnE0KJySKq1KzuEQM8C5x3loznj8GF/K02R76gCvy9g/5Sd
         5wDo3vE9WeQiyg9uf8N5ijnxc0E6yNuX8JNlnmzSvXferqMPYpjOg1d1mecFTxm56UWf
         0qGA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Be2JQYlVoD5CFNjlYHidLpiWL7qZAtlqOsPCxStozRf6FPZQNgvvFtq7jASoKbRVKN3XuL5JMu7c@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5/ggTWjN0QuqP+r0ZZm/IDxj6Nk5IV0NjpoUEYFO27nkF7a/
	BxN1iRcdNB9xJsQFP5cf0jVRWxnzHJ2pHoUyb7KHUvIDcj4Bt/WYmZ7LkEq+sfP08cMgCSlNCU9
	4ihAg5yIz4xifP/MCzzPpWfA/gM4Y14LA/3uB7rJsX2O/4DSY4WTJ3gjBO+AmI4Zo0TBvNecDUX
	iDENvprc4PQE/W+CE/mIrh7aMXIZhIC4Bahssp3g==
X-Gm-Gg: ASbGnct7Bcl4RCUwWaIGmR8QXlBZdTB8XnE+ZAk4zynKeamyy9f75BWYsKbYDdtM6bI
	TMS+152QTLnRWD+JWk5S4EOqTKbKT4JYhy7wkSkjUzm1wWa1+lBwa7/QJu4pXGQ74Kuw=
X-Received: by 2002:a05:6000:40d9:b0:3a3:5c7c:188c with SMTP id ffacd0b85a97d-3a4cb4a9b05mr12776052f8f.57.1748410689400;
        Tue, 27 May 2025 22:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/DjgyHmTi77sz4YL1AcotxWGV19kkLeazwVyYNyUm5/Yz03U89VIiuny/iYpw0zaxNaDubEkcm3y8xMlS5Ng=
X-Received: by 2002:a05:6000:40d9:b0:3a3:5c7c:188c with SMTP id
 ffacd0b85a97d-3a4cb4a9b05mr12776036f8f.57.1748410689059; Tue, 27 May 2025
 22:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528152832.3ce43330@canb.auug.org.au>
In-Reply-To: <20250528152832.3ce43330@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 May 2025 07:37:57 +0200
X-Gm-Features: AX0GCFtOIWFnFVkSToM6sYIdGjE7Y3_nseIDAEn1Nlq5PJJ_ber9SzlILoUMcCY
Message-ID: <CABgObfbCg1wiZJmnXFihmRLvPiJq2bCQH3MNVMfiUJphz4JW3g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the kvm tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>
> error[E0425]: cannot find function `mutex_trylock` in crate `bindings`
>    --> rust/kernel/sync/lock/mutex.rs:129:41
>     |
> 129 |         let result =3D unsafe { bindings::mutex_trylock(ptr) };
>     |                                         ^^^^^^^^^^^^^ help: a funct=
ion with a similar name exists: `mutex_lock`
>     |
>    ::: /home/sfr/next/x86_64_allmodconfig/rust/bindings/bindings_helpers_=
generated.rs:265:5
>     |
> 265 |     pub fn mutex_lock(lock: *mut mutex);
>     |     ------------------------------------ similarly named function `=
mutex_lock` defined here
>
> error: aborting due to 1 previous error

I thought that since Rust failures wouldn't have to be fixed by
non-Rust maintainers, they wouldn't block merging of non-Rust trees in
linux-next?

In this case it's not a problem to fix it up at all (I'll send a patch
to Miguel as soon as I've taken the little guy to school); it's just
to understand what's to expect.

Paolo


