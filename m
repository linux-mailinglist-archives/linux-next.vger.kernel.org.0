Return-Path: <linux-next+bounces-9048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1EC649C8
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16AE534C1B3
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 14:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8363A33375E;
	Mon, 17 Nov 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="czNw9cM2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E051DA55
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388761; cv=none; b=gq/8HPZIZsdqqPzKovgi91Xwzg8x2y5ihy5ahiAr5XxZpFdPaZQp11A2NLQjZJchFSb+7sspNs+LXEb0mlWxQg1HTNvOXF0uQZSwaxSCy6UA2xIq2En8tfq9PcBv/O67P40ADT1CAU+M2aaaNzl9N9V/HMQRmkzlovIMwQHWHX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388761; c=relaxed/simple;
	bh=Ymdn2zCsFNuZS0Wp4MUkFCj30gxmA3LKI+UzpIwdxHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBhYp4EABPr/fKCRob4la5s9SpGqJpRbDW22KhxI9j1Jb4fceLBsOvVxxGXXmrhb4lRwn8b85CEh/gp3zYXhKXbrnsdS6hpYbSXUJfmOP6GGb92JBvNqaUq/5kZCY04hGpGB/Z63RaefY6FMFR71law5qd0ZOQNubq8vJeENQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=czNw9cM2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso29193945e9.2
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763388758; x=1763993558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymdn2zCsFNuZS0Wp4MUkFCj30gxmA3LKI+UzpIwdxHY=;
        b=czNw9cM2EGv/0viUbbnYXeQlkLS2snCNSmD27RyfrX4P9nxr++b68oS564bXefbi5F
         ODTwRGRAT/8W3RuRNxLyWItq5KFWWfV1wmCcoei+FXmSOVSuse4wykhyoPDX9VTmWvRv
         WolasFGhtKhq46pCJyZ5Qmfdoy44FIKL2PVKZ3NBOQd0qS+8KNlrp5OUwWzmv1N2XUKE
         rc45rcCL25sq48FE9fHWO700iHKun1a57f6KdSBNlYUIU7sAdD/NTBD0u/lxp5DbOadS
         UQQiJK0olxtYl63089gZ7++h4sNl13B9SgXNaBGN6aOroRV37pAjc2Nxjuk+Rm7DPmnt
         6wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388758; x=1763993558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ymdn2zCsFNuZS0Wp4MUkFCj30gxmA3LKI+UzpIwdxHY=;
        b=CxclARPR1gLxDwm/B1q/cdUtk4GL/EbAYqeXEuyjVG792dlNMXsCVuRRdxnv64OACC
         e2ILbc1kW9Pew29rDjOiYcAnFZ/nVeqPnJyN426CDFzkvAVOTUiY6UTeOvXdP3gq7hb4
         vCBknYH/8iuEBqUFt6+7PbvGYm0hs3JrxVrwncUQr0wsxZt81hqfIDApmhN2UpMQ2oHx
         hMiscGRQ4ZkroTKmjkau0B8iSCMT+qoiGBQc6lrgpeX5WDf1wspiwJ5BzAZr5/fD9ZjB
         x5mUY6ssSDrJv4o5jR1542CFxpebe0JrOE8gGtijOFzOT1SV5W0ULMkHg5t+BW6B8Yaq
         9HUA==
X-Gm-Message-State: AOJu0YzDr9gP1Jx5jnIKyZnaWN3qgmrzXmff6pH1wt0Z2LkIurTNSQEN
	vPt+tCN5qBRZlvfAwgGkptZQ4DZ8OAjGJ0GbQ3nxXsi/QIGcGF8e+WaMew3TrQk1yKCg+9q6o+S
	qopTe16LFvq82aDKtunnH3P/CJ+6CA70s3m9CGrnV
X-Gm-Gg: ASbGnct62vN9Z4zp0HIp5i6e4Md7KG+T4rceK7AETw1S9nqpTh19g9fvKHSBy5qZSeQ
	o35nYfZ0/OYhQfjUvo1UBltISjzyYYI0SCL9R80yHrTo3ZjwpbqWGvHg7yTzPZVLcmoxcSPTWv6
	xvkChvJiMN1EDPtgOSMSHLG6ar4g9l/+AhxjH1BF5NCtSIS2gAtSM7gWXUXUeFiyizF/e1X/5Is
	fhMGkBdl7yM89kGKqoXozcm/Tn2+oBxd6hogPaSeJURKjg5hmaWI7FK6Umb1ZEtYfXOied39qz3
	1rFDKwxZCJvMlvmgM72YxQNqfQ==
X-Google-Smtp-Source: AGHT+IHjwQL0FVltVuGjmQLRKy7RbPw1tA/a87gMVx+iUN641CMIppvpL3H8a+Oqtf++ePeKHBHKUGxMZq2EWtBawco=
X-Received: by 2002:a5d:5d0d:0:b0:42b:3062:c647 with SMTP id
 ffacd0b85a97d-42b5933b426mr10669065f8f.21.1763388757771; Mon, 17 Nov 2025
 06:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117194924.162dd2bd@canb.auug.org.au>
In-Reply-To: <20251117194924.162dd2bd@canb.auug.org.au>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 17 Nov 2025 15:12:25 +0100
X-Gm-Features: AWmQ_bnu2zYoaegZk8T92B39xjs65aDzHWSs11yXdM2X67yTGBf22w72O8C29tI
Message-ID: <CAH5fLghELwpwtZ5x8C6_Ag6L_BrF+i_==+QXrMgV9ayNvmsWYA@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 17
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:50=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> The rust tree gained build failures due to an interaction with the
> drm-rust tree for which I applied 2 hack fixes.

This interaction is now fixed.

Alice

