Return-Path: <linux-next+bounces-8055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1702B2ED8E
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 07:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853AB582C3E
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 05:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C3C278150;
	Thu, 21 Aug 2025 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Vrigv+9u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JX+3IH4l"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CBB28B501;
	Thu, 21 Aug 2025 05:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755753875; cv=none; b=La0PCdXP2W6CYB5nTT7b856J2Je30OiNY6lvLrIGJ7g6MV396qBuV6XTDm5IH7DWUGHxODu08uJmv3Q3NcZ9oP+CgiOm1Tu34TRu1bAtE4Vk9vCI6bhDkF5Pfay+HJ3GVrHJyjEt9cR+36lv2cAb44pUeIMIUZfN2kJw9XGklhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755753875; c=relaxed/simple;
	bh=8ns+2TIpPPbpn660+84sy5QfIyn83tigEn0aIObNytQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+lZ+44JQnpeHfiHV+GyJBQlWlaJyreiPcYhobcilQo8HK+1ax3E1HwU2NCJRLsDgyKUaEovOd+xecIhlluIs2WpscblWDWSCFK7xyDFNlPGOQkToZRIB3oxmnIZAhroIgu12rOVMp2t56OMA2f1blezYGKur+ZjitGQC+6JNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Vrigv+9u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JX+3IH4l; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2CA48EC00FD;
	Thu, 21 Aug 2025 01:24:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 01:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1755753872; x=1755840272; bh=SJPt7K00Iq
	elkuKyXgKGLlDyRuQ+qS7cTRolUaJRHiw=; b=Vrigv+9uSsOIoslyPNkwU4FcS5
	6ubmsnctDg9qYI+L+AnXmCI9iXFVMmQsLNkUZ8FvoPT1AVWZOa61suc5lvubaCWH
	hUzGROIB0xuFBhbeiCwWCZ2UZRzCkGwh4fYt1+uxS4KwOicp8ZRQFFqcSfhm/azK
	seBHwlD0/eLDXOFfZKlKuIcpnX3ZtGB2KXp2hb+0/wZGAhcApeRebZzXwBygMLsz
	tQfafmVPMiJsoaArLavkMIewep1DpNrQxm9btFqYOHBsZcDP8iB36rksTnOQR/Jh
	dU5KsNM8Iwq4yTZf/w1pTefLdRL2NmlRKTIOpX+PPQcVkfV/Ag6DzSnwqaxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755753872; x=1755840272; bh=SJPt7K00IqelkuKyXgKGLlDyRuQ+qS7cTRo
	lUaJRHiw=; b=JX+3IH4lEwSTeIK6NAS91mefViZDFQKNuBQjBZRfa0GF8HwfWh6
	w1WHXBOeX9QwiITDyOQHVQJeyB5VZGH3mxdBfo4gnUIF+65tmgPLoKlTb1b2Viyo
	Ke00hpuOCHNrArUj0hJUX1xvQKa1it/gf503G2hgXfxBr9GplJ+asKcqXOxOVWfg
	nw2W5o9peVx4k+syUc5wL+OUHgQR0QdXzCfKlFLcgjBism5RbbcIFnVkrXR1EjZ6
	0HNS1yvMUb4XJ0mTzYCAVVWyvo58mcBp6zIBbq2YL6NXTBRhSolU8PigIsAlhwbv
	hmqmA3Bb9PH3ztmHiposRPO+6P8sn6VhUHw==
X-ME-Sender: <xms:j62maLSe462A9X71jGvyJcspZv4gv0M8CzSLyl2TAgLCXEgoGLnEWQ>
    <xme:j62maMWJjo5_Lqw3GQr9omJMeYaQdBDteNV_rVmo2e6JWfFHwnJItZAxdq6yzZALj
    iikMpdfT8F1SQ>
X-ME-Received: <xmr:j62maFI6j3x6DXyK85A-I6CkPSGpmu8F0cuVeC2lStbwIkpEBzRFsGTNM8mZvbP7N5IuT3elwCLsyaALZnZmFPY4FFKXThKMd30R-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepsghrrghunh
    gvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:j62maNgA2tfNjsrSKkAbe90hMRk0V1CbbDA_YJgmU62CGmruTIt1uw>
    <xmx:j62maCL9bx6XCb-jxm7Gihp4uYiWrCcwvM6cgKGary2mSwZswZIiwA>
    <xmx:j62maEhoqPHQEtlp2wbI4HztILrfJHJLNJjE9S-qpLPpVVjipvuyAA>
    <xmx:j62maI22i3HpFqUNnbBNCcDwKQkDrKZzaURdga-SSEjN47JNVim_4A>
    <xmx:kK2maNBq8t6n0Vw5CQNYNR_QBJ4uJhAIK1dNbSuNa9ASm5cOnI7nzM0w>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 01:24:31 -0400 (EDT)
Date: Thu, 21 Aug 2025 07:24:29 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <2025082116-cupbearer-average-5627@gregkh>
References: <20250821110212.08c134db@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821110212.08c134db@canb.auug.org.au>

On Thu, Aug 21, 2025 at 11:02:12AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the driver-core.current tree as a
> different commit (but the same patch):
> 
>   8e7e265d558e ("debugfs: fix mount options not being applied")
> 
> This is commit
> 
>   ba6cc29351b1 ("debugfs: fix mount options not being applied")
> 
> in the driver-core.current tree.

Thanks, yeah, we both ended up picking this one up :(

