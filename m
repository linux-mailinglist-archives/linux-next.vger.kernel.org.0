Return-Path: <linux-next+bounces-5673-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7BA551E1
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 17:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0203A9289
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 16:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955BA20C46A;
	Thu,  6 Mar 2025 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="qxPAq+02"
X-Original-To: linux-next@vger.kernel.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F75113635B;
	Thu,  6 Mar 2025 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741279933; cv=none; b=I06uSyKZU2rgxcn0LqgbEW27Hf9vdzElwXEraSx1KYpyhn2DMXaxe5G+FXQPEzPlwzjMX3w/TV1kmZAkaZkGwFCs1bjLusJEr3iaZYPdaX742+9nE9LzebpQzdPtDn4u/8hJ5cNXXXx+UdZuzM5YT8Nq10Ktzeur2Uey8ROHxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741279933; c=relaxed/simple;
	bh=lm5fyQc/yf+WIzuYFzg1Y0Mehud9BcnFntufV1RhyPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmCWoh/uzDY1dGrvmQT1vcQKydqeQvTECY01x7W7AcKmMPodq6t/UnLIQzFK269MACcfVivNmSPKf5SNm1EoSS2xtOHsQJcMaOZZ5pZ+sRC2j7p1j8j5V/2t12AZBt5vjGIPgmq4cKDdzzoUfDQMhpXl295aSbi5UQivdYQBL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=qxPAq+02; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 6.2.1)
 id 95be90d662371133; Thu, 6 Mar 2025 17:52:09 +0100
Received: from kreacher.localnet (unknown [195.136.19.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id A33D09A0DA9;
	Thu,  6 Mar 2025 17:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1741279929;
	bh=lm5fyQc/yf+WIzuYFzg1Y0Mehud9BcnFntufV1RhyPM=;
	h=From:Subject:Date;
	b=qxPAq+02mrjdn+rWpx5I8pYhlux+geCPmdo4XfM3DGXYRjOAOqwtIFG4m3wvpGWZJ
	 J36QYUbrRme1shT769pOkxENbAj06QbkrVPuNRABAAWkde5fEaQdm4AsPADNKI88qp
	 mgzHzgNlN9YiSmRLPEvHq0ZHAx5fe2H/TrFFd+Gg9uZIzvkN2CG2eqOXg5pEQk+mtW
	 7uU/byKlA4H12fngM6ZcKy2ieBvavbFbD7A9AW+9BpXNGcTow8zJh1XvffkhAOZwdR
	 imvwQ3xzBNJr/Q3pDUCHgR7b30gqFAzdJrIWvb9KY8krwwaYusjQ5fZP9bIIMxfufL
	 XMpodqPR7zYDA==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Date: Thu, 06 Mar 2025 17:52:08 +0100
Message-ID: <5011851.31r3eYUQgx@rjwysocki.net>
In-Reply-To: <8664c2f4-122c-4798-8a12-3797d07a9522@amd.com>
References:
 <20250306082858.70e08bc7@canb.auug.org.au>
 <8664c2f4-122c-4798-8a12-3797d07a9522@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 195.136.19.94
X-CLIENT-HOSTNAME: 195.136.19.94
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepfeduudeutdeugfelffduieegiedtueefledvjeegffdttefhhffhtefhleejgfetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudelhedrudefiedrudelrdelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleehrddufeeirdduledrleegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrjhifsehrjhifhihsohgtkhhirdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepffhhrghnrghnjhgrhidrfghgfigvkhgrrhesrghmugdrtghomhdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6

On Thursday, March 6, 2025 7:15:57 AM CET Dhananjay Ugwekar wrote:
> Hello Stephen,
> 
> On 3/6/2025 2:58 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   f6c0b7602909 ("cpufreq/amd-pstate: Fix the clamping of perf values")
> > 
> > Fixes tag
> > 
> >   Fixes: 305621eb6a8b ("cpufreq/amd-pstate: Modularize perf<->freq conversion")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Maybe you meant
> > 
> > Fixes: 620136ced35a ("cpufreq/amd-pstate: Modularize perf<->freq conversion")
> 
> Yes, you're right, I was referring to that commit,
> https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=bleeding-edge&id=620136ced35a9329f4d1ea90e51bee2dfd7ee5b0
> 
> Rafael, will you be able to fix the tag it in your tree?, or should I send the amended patch separately?

No, I'm not, this was pulled from Mario.

Mario, can you please fix this and send a new pull request to me for the
same material?

Thanks!




