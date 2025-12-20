Return-Path: <linux-next+bounces-9493-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C492ECD2442
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 01:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42989301B2DC
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 00:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA34B1DF258;
	Sat, 20 Dec 2025 00:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sW71doH6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD191DE2BF;
	Sat, 20 Dec 2025 00:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766190567; cv=none; b=QYT3Z064SduaWD++6ns7OmyxteekGz2StH1LDjiJbYjOBYjqI4gJj++mqN9evY9rONLSrAHklGfdxIC87ONpBjqhPvo8DAcgVV7krCcQw+1kLXEWWjuwDjyNXIkdaYUI5LMUupcJYpQnFOqGPUS5KZnb9Vlb0TTSeMzO1F2W1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766190567; c=relaxed/simple;
	bh=ui3/c2KbiD/CV+Hds1fj4ORmxTQtqz4P4EKk/8JtR24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEvSigwmuYSUEmHIAgL8jw5tLQYbeTePVUZCqD+RAwIhax5HTLfS/bRCFt08RJYdr4JfiLUa5Sc8P1FpZCfWrEMc/ftJeK7PTF7MAZ4nfnVhh5RYBD1kaM6OzvrlEVrU2b4gnOalR1I5tsgDHIqODopKyxp5AKWm4S2AHq+uU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sW71doH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D073C116C6;
	Sat, 20 Dec 2025 00:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766190567;
	bh=ui3/c2KbiD/CV+Hds1fj4ORmxTQtqz4P4EKk/8JtR24=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=sW71doH62d88hkfDk5uLTKQi/P6RGjIGioeVwQKwdEWcliDyCfkE2JdNs86odvxtq
	 5N7GAOmoDte79WgWcG/rluTGPN8Ch14Js6DItL/gHRCehPRemZsaZ6rORW6gDB8eb6
	 BLW8/KC6UcOKrTMXhfQmsi9PdxAZq27CUr//vuc4aYFJxcUWSrWvcw7lo2PfgvCO0Y
	 gJ6m/q+Avvo/RMmbYYTTF3ru2TGY0M6/rrcBAIIvRSVGffIOkwWHP/Wurf82WPXC3g
	 aGjuX2sqznX0sh7pL0lRJ27Y5a+uj+zWADXetXsJB5XkEM99EXKrjemE3uPGc4t/Yw
	 NShsigTKYJYbQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 01F9BCE0DE7; Fri, 19 Dec 2025 16:29:26 -0800 (PST)
Date: Fri, 19 Dec 2025 16:29:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>, kernel-team@meta.com
Subject: Shutdown-time hangs in -next in locktorture
Message-ID: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Peter,

I started hitting shutdown-time hangs in next-20251217 which persist
in next-20251219.  This hang happens on both x86 and arm64.  Once I
figured out that the failure is high probability, but not deterministic,
bisection converged here:

5d1f0b2f278e ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")

This commit reverts cleanly, and doing so restores hang-free operation.

The reproducer is shown below.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

for i in 1 2 3 4 5
do
	tools/testing/selftests/rcutorture/bin/torture.sh --duration 20 --do-none --do-normal --do-locktorture --do-kasan --configs-locktorture "LOCK09"
	ret=$?
	if test "$ret" -ne 0
	then
		exit "$ret"
	fi
	echo Test $i succeeded
done
exit 0

