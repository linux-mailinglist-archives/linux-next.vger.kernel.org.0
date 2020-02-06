Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B174154938
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 17:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbgBFQaU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 11:30:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:46934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbgBFQaU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Feb 2020 11:30:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCE0E214AF;
        Thu,  6 Feb 2020 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581006619;
        bh=xJYY2FlK3sHZ7iGlNE5BLKQ/qSvsKjlGSxtpoN4RjLM=;
        h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
        b=xG66qzmJ0CDofOTMIbuAF915Kv3E5eNskzNK+hhNNptTloeeSfesJtJjYKXWWe5WF
         gVoB/PCViNXV+QmZ7M/v/1p6zIXUK6dgIBMBs6fzWg78B14AAmZ0wAIHj5m4/mpUU5
         f/B7tzCGiHRZqmSPXDAy2/++u/l4dR0msnXow8Ss=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200206083418.3a6025f6@canb.auug.org.au>
References: <20200206083418.3a6025f6@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the clk tree with the devicetree-fixes tree
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Rob Herring <robherring2@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 06 Feb 2020 08:30:18 -0800
Message-Id: <20200206163019.CCE0E214AF@mail.kernel.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-02-05 13:34:18)
> Hi all,
>=20
> Today's linux-next merge of the clk tree got conflicts in:
>=20
>   Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
>   Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
>=20
> between commit:
>=20
>   04dbd86539fd ("dt-bindings: Fix paths in schema $id fields")
>=20
> from the devicetree-fixes tree and commits:
>=20
>   e6747e24f15d ("dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/s=
c7180/msm8998")
>   8cff43d46cfc ("dt-bindings: clock: Cleanup qcom,videocc bindings for sd=
m845/sc7180")
>=20
> from the clk tree.
>=20
> I fixed it up (the latter changes seem to have included the former,
> plus I removed Documentation/devicetree/bindings/clock/qcom,gpucc.yaml)
> and can carry the fix as necessary.

Thanks Stephen. Rob, you may want to drop the change to qcom,gpucc.yaml
so that conflicts are reduced.

