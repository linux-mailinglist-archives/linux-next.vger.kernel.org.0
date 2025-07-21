Return-Path: <linux-next+bounces-7655-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4AB0BEC7
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 10:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF4E1891706
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 08:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06562289E0F;
	Mon, 21 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFr9kTEQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B928983E;
	Mon, 21 Jul 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086271; cv=none; b=S6Wbvc3SpduwtMo8m8eydVT9t55ec1VzSOQwJpVbzziEtWll+PIAvbOG4WiuEvOeNX1YAr4YKsXBUsG185Sj24jjMJspvgwYcftHSqvrjunWe7hyu0ppiBkD6ksK7k4eHvAHfi8g2zlmWi1XsZKK0yQd4LvIEHKzVSk43Z2luFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086271; c=relaxed/simple;
	bh=y3NsddEuiP+QxoczVaOzTRWh8X7+x94E0LzTQuEO17o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpUCyDF78OW/O/HinYCf0/5HLV9OGycFlJa5j5Eb0DFHABG9iFHsn2QDa4qlN2S0aEXuPpiVqyd//YgUOFME3V/jhut8F/1eCA0jIz9PsXhyD33SDDgK3Wyq4y5Ajnmw5ltykMGin7uzIdocp6Gs4GeWb3e/TGOxsxJJSUS6rbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFr9kTEQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235db423abdso2845535ad.1;
        Mon, 21 Jul 2025 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753086270; x=1753691070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3NsddEuiP+QxoczVaOzTRWh8X7+x94E0LzTQuEO17o=;
        b=mFr9kTEQ/tAWyVDXPcu7yhaPcH3yDNymInvN2Gg+bBneZDB8qVJF3hhpAy8Pv/KY85
         Kcsm6bU9vdLaJRCJ/jmqLKEAoct98lwttp7HwSprcgI5pbNPCaWyhq5DMvTQjTEKcQFI
         UfYmLUXYBLqGuLYGQgNO6j8UWXfK1DK4sKpba9aRupLpGZonYc+TYD6dXyZ1+tG88vvn
         Bc5ao0b1sqX1m1EL6s0r9KvHba5NCutVGE+7LOjyfN+CwjOFl25VfVnf3j/DpAYeBIAl
         SDSF9kEtdhpnJrUvdn8VggZCB0fDvN1nKTQ4FNhO/G96xHbtgjYXDB1MiA0Pz01ZWhO4
         vxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753086270; x=1753691070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3NsddEuiP+QxoczVaOzTRWh8X7+x94E0LzTQuEO17o=;
        b=eqhXrgeL8sROHKLEJe6hndbwV4OCP5gajrScSJvKZ2njjCPhplzE6fVCkEr+S0ntYQ
         T1/oLWFndH/1RakGFO0B5TAdpOIjhEH81ryxZ7I+89ZC/MXFkMEfKMIq9xBkP7PsT7gb
         De0ySVr1NOoT/FfWT4bcLYNstH7bkTOZQAvOKHdp5ClDCCjUvFqW/aIwn9G3QrjbqMNt
         EPYdmQSt97FQvv9c9JEvwgh+ddbUnHDCU7HQcAljwy2up12ruqsZ+BNLyRmAFZWa6Mjr
         9Vz8umxx2f9PDc8sBtEcClYw+enA+Sd6m132qW42l/BqffQ8Q6O8yoot0wmavtTvq2L2
         yxDg==
X-Forwarded-Encrypted: i=1; AJvYcCV/HW1M6rcRFJYo8GjnvGAwBdUfiyiMx51uuUn4tlXfQoaLS+beXWNO3KjMufDakc1iHMgvwR/or2THYA==@vger.kernel.org, AJvYcCWbnxV/J4UuVNxYiXnWYnbOT9E1dIiK6nO8fxOC/D0f+QB2ahBCrP0wQE6QVP9zLWFA5cD0nFXqKKUpb+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEHItvMhIgUEwgkQqVJ9fQtpPI2bt++o2ja6d8IKf0buUG2Ia
	Kfs03tghIKQZxJya8pHH13cFT0dvZR75uH5QwQKJYO4Mu3WpypklYPOKyQmSll5gsXOXfhSO0I7
	ReazrOtuRwtn77y0cPvGeaQg6/FuakOU=
X-Gm-Gg: ASbGnctGemnfm7D6wpMQJLavRmMJN2DnPwUInZDOvxqRPbW2BqP5D/7PamGEK/2FiQM
	YBqADr52Cc3zqPbB5EM6WPDSbmf0y1uCPyaCosozo1a6Pj3KGip/adE9x0UgZ7GuFv/BookMwdq
	MgJsLlVNcOL3uG7KT6ghCYRZ3IXxU8JE2yBKoi/gyxj9GqY3MYUvP7vHdbwia+fqAwTRjLv2xgQ
	0tm75lH
X-Google-Smtp-Source: AGHT+IEpYm1grjdieqRklsFle4Ecr3bPVdl7flN5GyEKouQ7q3ac7T5kZl2ZQi8tfCTv5JUzwrl5vIEwMT5lsUJXBy4=
X-Received: by 2002:a17:902:f68a:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-23e24e14eb5mr115953585ad.0.1753086269740; Mon, 21 Jul 2025
 01:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721142526.2903169c@canb.auug.org.au>
In-Reply-To: <20250721142526.2903169c@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 10:24:17 +0200
X-Gm-Features: Ac12FXx40NIoX85H9Foc_V9WQmKmNRisyUuEaIbGuKlVbIeUXp7RF_ab5wbloo8
Message-ID: <CANiq72=YERpfj17r5p01xFqUbb44g8e2+Kh1hqT_iHTBM6jO3A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Remo Senekowitsch <remo@buenzli.dev>, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 6:25=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel

