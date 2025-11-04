Return-Path: <linux-next+bounces-8820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F7C32F14
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 21:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1E734E3F1C
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 20:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832691D5CC9;
	Tue,  4 Nov 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enuF+QGr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09634D3B6;
	Tue,  4 Nov 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288655; cv=none; b=TivoLQ7MeJK2K+w8hN3MLuv3OUZJFjtHWyPamfggHWarXvyBJXnGDpTvr/KOIMXE5R6/Cvo0uF/TP5lNlk+VEW0dPeolidJJROlT9KMCB4LpgJRm4ykoIt4EyXUpqqwmtUqfLwyXX41PSbkTB4/v2wAAd3hvBe93XooYuwOL2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288655; c=relaxed/simple;
	bh=fdaAzg1Hz7sqSy5Oi1OXX0ZoW35Gu2Cli5lhAFQosUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXgISHhOlmAVPoKCwu72+oyqDozK1KvetTNFRraK/aQx29fU49s4Knu9ANpCBi6ywG0zPhgqR6Ng5JGLzzdI/7gGNbWXAifguZEjh5pdaMpObSYwh7iO0Fv8Na2D+NdXyYEvlyu4IfpbC77RRXRmNuqa19IBMnhbx4UFD2uTIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enuF+QGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0741BC4CEF7;
	Tue,  4 Nov 2025 20:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762288655;
	bh=fdaAzg1Hz7sqSy5Oi1OXX0ZoW35Gu2Cli5lhAFQosUE=;
	h=Date:From:To:Cc:Subject:From;
	b=enuF+QGrzhIYhdsY6bTDweJNEbQJvIeD4IgKwOmTEz/zrhOdLlquH3dFLjuOWDooC
	 NTUBJvYSH48r5anSGHhIbDx9JfKG1BkyRoA6t/w9C7TCLGt7tbZ8H3g8ZD/ihblhsE
	 y146Qy/YptO2S1j5XkkuguIz9FP91omqjU0SJPbiAqd5Swa8jmi8sZ3tcotf4PPg3c
	 Dc8L2i2sTyDMEil7Q5NQ+g7rr7G6in8CODhG51bwcAda8WahhG3HPObBRGYu5BpQPy
	 GhWwsj9bXbaeOqgmBq50lUL2yefyq8vEYkflb7T2HA0Fb3MUtAbocYO7h8Hl6OzX3E
	 7uhip7gPI+Dwg==
Date: Tue, 4 Nov 2025 12:37:33 -0800
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Add tenstorrent to linux-next
Message-ID: <aQpkDYXT3N6qWiZs@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I have setup device tree branches for Tenstorrent RISC-V SoCs, and I
would like to add them to linux-next for testing coverage. I have sent a
v6.19 PR to Arnd to add the Tenstorrent Blachkole SoC device tree [1].

tenstorrent-dt-fixes git https://github.com/tenstorrent/linux.git#tenstorrent-dt-fixes
tenstorrent-dt-for-next git https://github.com/tenstorrent/linux.git#tenstorrent-dt-for-next

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/aPUemXdOFZEdkayE@x1/

