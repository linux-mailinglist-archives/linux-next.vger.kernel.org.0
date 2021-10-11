Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0B242883C
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 10:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhJKIED (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 04:04:03 -0400
Received: from verein.lst.de ([213.95.11.211]:36271 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234753AbhJKIEC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 04:04:02 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id CF92A68AFE; Mon, 11 Oct 2021 10:01:35 +0200 (CEST)
Date:   Mon, 11 Oct 2021 10:01:35 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Simon Ser <contact@emersion.fr>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211011080135.GA11242@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr> <20211011074316.GA10882@lst.de> <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr> <20211011075125.GA11098@lst.de> <eOlxebs_u0NKPwzSFL2q48CRHVKEXqiWyoQcHWDsG5qHnhrrphhwczUtgd4bE1o1988Jja35uxf3pWwn2lU8I_5Tmyk1WzeKYQ7yi9qS4sc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eOlxebs_u0NKPwzSFL2q48CRHVKEXqiWyoQcHWDsG5qHnhrrphhwczUtgd4bE1o1988Jja35uxf3pWwn2lU8I_5Tmyk1WzeKYQ7yi9qS4sc=@emersion.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 07:57:17AM +0000, Simon Ser wrote:
> No, we can't have a "I_AM_NOT_BROKEN" ioctl for each and every uAPI mis-use.
> User-space detection has been determined to be the best course of action.

If your API addition breaks userspace, yes you need an add-in.

> I guess I'll just inline these functions in the driver then, if a revert will
> be NACK'ed by you?

It will be NACKed, and I will also complain to Linus about any PR containing
buggy code like this.

With your completely broken change you cement in a mapping of an executable
name to map to what you consider a "bug" without any way to fix it up.

Which is even worse for a something fast moving like chrome/chromeos which
will eventually gets its act together and fix things while you'll keep a
weird feature mismatch just for it around forever.

No wonder our graphics stack is stuch a convoluted buggy mess if you keep
piling broken workarounds over workarounds instead of sorting things out
properly.
