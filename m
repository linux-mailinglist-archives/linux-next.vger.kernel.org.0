Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFE53DA1CC
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 13:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhG2LKq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 07:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhG2LKp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 07:10:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7502360F01;
        Thu, 29 Jul 2021 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627557043;
        bh=6AqU7a9rl08gRBYUbq6F+fFWAGWmA5ea41X21vUy4Zw=;
        h=From:To:Cc:Subject:Date:From;
        b=eyIIHSLugjELWDryt0+Qe2+FjxRwKWJ7m0qCad9dQg269MF69+hZLtvhh44+IQFYj
         Lk+qD43GDJoF/BkFL9Emc9uw/bZDWtnpXazp8nmuYjwb8sV/YWsBK0ZUEzh9C788mf
         xWP1sLnBEEThghdmm+7/c6zIJ3z9huJXSIbfTwTauXvU0TrAf2oX5F4tFM2JQJQCWI
         iPaqfnjxVDs90SjMR10I3gvyjKZULhJC0Pv4DpYS3PExr8MH23UOU6KpNe2/zby3D/
         wytVpBaoN1Fo3VzeAcDqPbHoUOEH/j0tRtdgPXNM+dHt6vgjHs8XC0Vb6ixaXkxN38
         47/Kfl3/tVJRg==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm-next tree
Date:   Thu, 29 Jul 2021 12:10:27 +0100
Message-Id: <20210729111027.33028-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gem.c

between commit:

  60f800b2bdfa ("drm/msm: always wait for the exclusive fence")

from the drm-next tree and commit:

  1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/msm/msm_gem.c
index 39c35414d7b5,5db07fc287ad..000000000000
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
