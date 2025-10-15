Return-Path: <linux-next+bounces-8600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430EBE0D9F
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72763ADEE7
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D513016E7;
	Wed, 15 Oct 2025 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2FWbtZh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9A3002D6;
	Wed, 15 Oct 2025 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564667; cv=none; b=ZqRpxtqvvDCrTwhg2kQjZdwiBXswe8W63qCZrpcGiqb53dPZPfZcaedaBlddhXd9amLmOn7k51KmHGdSuZe57Mu93f+pbZ7EygSegcyY3MAESbvYbsYa7Aeh4bG/jHuz1CEhpdmFie4DUhVTd2GJhwvA86aqZynBb2NYmblucpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564667; c=relaxed/simple;
	bh=GvM0H2jemaKiulGxxUGbUsXIG/ynh8EeDADGYYyjn5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ddP7P173zJq3kBLuFvwTFcqGvzfUQz79rZTDBl8qU2vhOGWWG0+7s96AbQHxFtJRU2ygTDNzqYuHlnWfJ3FmTAe/d9MmO4Hz9gJODHjx15SsiONLAg6YhVHeR8F6Lx4uwLX8GlGOEp8jzuVtrwrB6R0w7+HdKXw8NY5XbeUIKbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2FWbtZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2C5C4CEF8;
	Wed, 15 Oct 2025 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760564666;
	bh=GvM0H2jemaKiulGxxUGbUsXIG/ynh8EeDADGYYyjn5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A2FWbtZhtIJ18tNFs688T1Q3y2ymznhqxOqETwJIYAKSkM1ggvVkTFlFlnhqqYsYa
	 1kmYXDte85+LRCcey054AWSeac0I9RjiPPAwpOhTChZxlAgNQgplIWRJYjYQrfHKZz
	 1F5aY0IoYlLJBOkiLwcc2FMp1KwjkQTsv0e+HXjqMeAhl7cBGIaeNp+2cFrj6zhfjB
	 AMileyd4NjROUTTsBkjm0rwerUu70ZyAkvest22uEtOC69k0Myzrdyr2PCHaw0rrUv
	 XCQUOkZCzINEjHdivL3QcAN9pbD1QG/Vol//lqpqVRlt0fQWRMm5wQrGZAjZlrhwU8
	 MqmYpY1bqf+5w==
Date: Wed, 15 Oct 2025 18:44:16 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org, broonie@kernel.org
Subject: Re: docs build problems
Message-ID: <20251015184416.4340e8f2@sal.lan>
In-Reply-To: <87sefj7tom.fsf@trenco.lwn.net>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
	<87sefj7tom.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 15 Oct 2025 15:15:37 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Randy Dunlap <rdunlap@infradead.org> writes:
>=20
> > Hi,
> >
> > I am back to having one former error and one former pair of warnings
> > on today's linux-next (20251015):
> >
> > ../Documentation/Makefile:71: warning: overriding recipe for target 'pd=
fdocs'
> > ../Documentation/Makefile:62: warning: ignoring old recipe for target '=
pdfdocs'
> >   File "/usr/bin/sphinx-build", line 1
> >     =7FELF.=01.
> > SyntaxError: source code cannot contain null bytes
> >
> >
> > Did something happen to the docs/docs-next tree or was there some kind
> > of mis-merge problem? =20
>=20
> I pulled docs-next forward to -rc1 and merged a few things, but I
> wouldn't expect any of that to create that kind of problem.  It seems we
> lost the makefile fix somehow...?

Just did a rebase. Those patches are missing:

e2c3ba36aee2 tools/docs: sphinx-build-wrapper: -q is a boolean, not an inte=
ger
0ce66e3f9c8b kernel-doc: output source file name at SEE ALSO
9b34d25a58ae docs: Makefile: use PYTHONPYCACHEPREFIX
d5da902cc340 tools/docs: sphinx-build-wrapper: pdflatex is needed only for =
pdf
1cad2682b785 docs: Makefile: avoid a warning when using without texlive
f0a4ad647aad tools/docs/sphinx-build-wrapper: allow skipping sphinx-build s=
tep
fb4771ad4ff4 docs: Makefile: fix rustdoc detection
ed7faec0095d tools/docs: sphinx-build-wrapper: fix compat with recent Tumbl=
eweed
ab7dde2453af docs: conf.py: get rid of load_config.py
8f421d0c327f scripts: remove sphinx-build-wrapper from scripts/
9a20d16551af tools/docs: sphinx-build-wrapper: handle sphinx-build errors

Want me to re-send them?

Regards,
Mauro

