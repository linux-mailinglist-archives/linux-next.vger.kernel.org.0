Return-Path: <linux-next+bounces-6080-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D3A75382
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 00:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699DF7A58C2
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 23:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ED61E5202;
	Fri, 28 Mar 2025 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mk9nwNNr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC21DF72F;
	Fri, 28 Mar 2025 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206329; cv=none; b=gKMcvNyVu9JqXqBSJ5sy2pgYsJzvhv4ujHLHDYxgYnLwQ/p/p1FsgKtV5GLt0TOj+2g2QVH9JX4Ppb880f4KzcirKMHdTndFx10vA2uhCRXpiQi/9wopF9t062NRrTR/Tr/Vs76bue/QRZQJz/T3CwQZcFRpyS4fc199lGXmLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206329; c=relaxed/simple;
	bh=Bxm80cBalQozE1vWSHIUzYZ2Hf/6KOUmvxmaUqxdtio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2rjwdei2+aV3S10LTq5N6uf3s7gCEV/8haHfyonmsoxXMJAdx7FfU/v8aVrHc1zNblSW9VuMz9Q45hqJP0fnJXz0JiB8NO42sbQt+6QS1is3LnC+Eld0IJV24x6hF1MW/bVphAdYfLb4adqTQwsBQzUeJgApP6w21aIPhyT0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mk9nwNNr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E7BC4CEE4;
	Fri, 28 Mar 2025 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206329;
	bh=Bxm80cBalQozE1vWSHIUzYZ2Hf/6KOUmvxmaUqxdtio=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=mk9nwNNrvFna9dB+/SAaTMiB5c8jpiCDKGLtHl+LLw4eDlP3agJ58XxOcrC6RSTty
	 O1Ai1CMVzFYyWMCQimjx9piWrJw2MWENlP/eBP3c6uwRepqaGluRF5pIM6UmL1Z+bK
	 F+4gHjAXD46PexYrjlnpSHEgVL7/rIEzwgHfU2LO9UGW7Pk7PFsAqeEd/7ccGpLipY
	 vDYZoLTkw2ev7Xm3JWHVJ/7Fs1NXt3f9eitggAgc2C62EQM+b2ORGYBnaKwKyF4O09
	 /71fJTX5UKjt6DrzUGwmUp+NNAOam/pvsYMsoLaMQPCJceOqYhUUo92zxRQbuz/sRs
	 TsBu9+VMOHtOg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CF2D2CE0889; Fri, 28 Mar 2025 16:58:48 -0700 (PDT)
Date: Fri, 28 Mar 2025 16:58:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <fa4ee4e3-40f7-4e11-be14-7cd0b223def4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>

On Fri, Mar 28, 2025 at 04:26:21PM -0700, Dan Williams wrote:
> Paul E. McKenney wrote:
> [..]
> > > > Making the above change got me this:
> > > > 
> > > > usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
> > > I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?
> > 
> > make clean
> > make allmodconfig
> > make -j$N
> > 
> > Though encapsulated as follows:
> > 
> > tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig
> 
> The problem is that uuid_t is not defined for uapi headers to reuse.
> Perhaps checkpatch should be checking for uuid_t in uapi headers going
> forward.

And for whatever it is worth, "git bisect" converged here:

9b8e73cdb141 cxl: Move cxl feature command structs to user header

> For now the following builds for me, but it is a quite a mess to undo
> the assumption that that the hardware object definitions can not use
> uuid_t:

Even better, this builds fine for me:

Tested-by: Paul E. McKenney <paulmck@kernel.org>

Thank you both!

							Thanx, Paul

> -- 8< --
> diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
> index f4daefe3180e..d626dd7c5fbf 100644
> --- a/drivers/cxl/core/features.c
> +++ b/drivers/cxl/core/features.c
> @@ -33,7 +33,11 @@ static bool is_cxl_feature_exclusive_by_uuid(const uuid_t *uuid)
>  
>  static bool is_cxl_feature_exclusive(struct cxl_feat_entry *entry)
>  {
> -	return is_cxl_feature_exclusive_by_uuid(&entry->uuid);
> +	uuid_t uuid;
> +
> +	import_uuid(&uuid, entry->uuid);
> +
> +	return is_cxl_feature_exclusive_by_uuid(&uuid);
>  }
>  
>  inline struct cxl_features_state *to_cxlfs(struct cxl_dev_state *cxlds)
> @@ -228,7 +232,7 @@ size_t cxl_get_feature(struct cxl_mailbox *cxl_mbox, const uuid_t *feat_uuid,
>  		return 0;
>  
>  	size_out = min(feat_out_size, cxl_mbox->payload_size);
> -	uuid_copy(&pi.uuid, feat_uuid);
> +	export_uuid(pi.uuid, feat_uuid);
>  	pi.selection = selection;
>  	do {
>  		data_to_rd_size = min(feat_out_size - data_rcvd_size,
> @@ -282,7 +286,7 @@ int cxl_set_feature(struct cxl_mailbox *cxl_mbox,
>  	if (!pi)
>  		return -ENOMEM;
>  
> -	uuid_copy(&pi->uuid, feat_uuid);
> +	export_uuid(pi->uuid, feat_uuid);
>  	pi->version = feat_version;
>  	feat_flag &= ~CXL_SET_FEAT_FLAG_DATA_TRANSFER_MASK;
>  	feat_flag |= CXL_SET_FEAT_FLAG_DATA_SAVED_ACROSS_RESET;
> @@ -360,16 +364,19 @@ get_support_feature_info(struct cxl_features_state *cxlfs,
>  			 const struct fwctl_rpc_cxl *rpc_in)
>  {
>  	struct cxl_feat_entry *feat;
> -	const uuid_t *uuid;
> +	uuid_t in_uuid;
>  
> -	if (rpc_in->op_size < sizeof(uuid))
> +	if (rpc_in->op_size < sizeof(in_uuid))
>  		return ERR_PTR(-EINVAL);
>  
> -	uuid = &rpc_in->set_feat_in.uuid;
> +	import_uuid(&in_uuid, rpc_in->set_feat_in.uuid);
>  
>  	for (int i = 0; i < cxlfs->entries->num_features; i++) {
> +		uuid_t feat_uuid;
> +
>  		feat = &cxlfs->entries->ent[i];
> -		if (uuid_equal(uuid, &feat->uuid))
> +		import_uuid(&feat_uuid, feat->uuid);
> +		if (uuid_equal(&in_uuid, &feat_uuid))
>  			return feat;
>  	}
>  
> @@ -461,6 +468,7 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_get_feat_in *feat_in;
>  	u16 offset, count, return_code;
>  	size_t out_size = *out_len;
> +	uuid_t uuid;
>  
>  	if (rpc_in->op_size != sizeof(*feat_in))
>  		return ERR_PTR(-EINVAL);
> @@ -477,9 +485,10 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	if (!rpc_out)
>  		return ERR_PTR(-ENOMEM);
>  
> -	out_size = cxl_get_feature(cxl_mbox, &feat_in->uuid,
> -				   feat_in->selection, rpc_out->payload,
> -				   count, offset, &return_code);
> +	import_uuid(&uuid, feat_in->uuid);
> +	out_size = cxl_get_feature(cxl_mbox, &uuid, feat_in->selection,
> +				   rpc_out->payload, count, offset,
> +				   &return_code);
>  	*out_len = sizeof(struct fwctl_rpc_cxl_out);
>  	if (!out_size) {
>  		rpc_out->size = 0;
> @@ -502,6 +511,7 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_set_feat_in *feat_in;
>  	size_t out_size, data_size;
>  	u16 offset, return_code;
> +	uuid_t uuid;
>  	u32 flags;
>  	int rc;
>  
> @@ -510,7 +520,8 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  
>  	feat_in = &rpc_in->set_feat_in;
>  
> -	if (is_cxl_feature_exclusive_by_uuid(&feat_in->uuid))
> +	import_uuid(&uuid, feat_in->uuid);
> +	if (is_cxl_feature_exclusive_by_uuid(&uuid))
>  		return ERR_PTR(-EPERM);
>  
>  	offset = le16_to_cpu(feat_in->offset);
> @@ -525,9 +536,9 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	rpc_out->size = 0;
>  
>  	data_size = rpc_in->op_size - sizeof(feat_in->hdr);
> -	rc = cxl_set_feature(cxl_mbox, &feat_in->uuid,
> -			     feat_in->version, feat_in->feat_data,
> -			     data_size, flags, offset, &return_code);
> +	rc = cxl_set_feature(cxl_mbox, &uuid, feat_in->version,
> +			     feat_in->feat_data, data_size, flags, offset,
> +			     &return_code);
>  	if (rc) {
>  		rpc_out->retval = return_code;
>  		return no_free_ptr(rpc_out);
> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> index d6db8984889f..1e3323854994 100644
> --- a/include/uapi/cxl/features.h
> +++ b/include/uapi/cxl/features.h
> @@ -8,11 +8,6 @@
>  #define _UAPI_CXL_FEATURES_H_
>  
>  #include <linux/types.h>
> -#ifndef __KERNEL__
> -#include <uuid/uuid.h>
> -#else
> -#include <linux/uuid.h>
> -#endif
>  
>  /*
>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
> @@ -60,7 +55,7 @@ struct cxl_mbox_get_sup_feats_in {
>   * Get Supported Features Supported Feature Entry
>   */
>  struct cxl_feat_entry {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 id;
>  	__le16 get_feat_size;
>  	__le16 set_feat_size;
> @@ -110,7 +105,7 @@ struct cxl_mbox_get_sup_feats_out {
>   * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
>   */
>  struct cxl_mbox_get_feat_in {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 offset;
>  	__le16 count;
>  	__u8 selection;
> @@ -143,7 +138,7 @@ enum cxl_get_feat_selection {
>   */
>  struct cxl_mbox_set_feat_in {
>  	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
> -		uuid_t uuid;
> +		__u8 uuid[16];
>  		__le32 flags;
>  		__le16 offset;
>  		__u8 version;
> diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
> index f2957a3e36fe..d0276ab3a92f 100644
> --- a/tools/testing/cxl/test/mem.c
> +++ b/tools/testing/cxl/test/mem.c
> @@ -1397,7 +1397,7 @@ static int mock_activate_fw(struct cxl_mockmem_data *mdata,
>  
>  static void fill_feature_vendor_test(struct cxl_feat_entry *feat)
>  {
> -	feat->uuid = CXL_VENDOR_FEATURE_TEST;
> +	export_uuid(feat->uuid, &CXL_VENDOR_FEATURE_TEST);
>  	feat->id = 0;
>  	feat->get_feat_size = cpu_to_le16(0x4);
>  	feat->set_feat_size = cpu_to_le16(0x4);
> @@ -1441,8 +1441,10 @@ static int mock_get_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_get_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>  
> -	if (uuid_equal(&input->uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_get_test_feature(mdata, cmd);
>  
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;
> @@ -1485,8 +1487,10 @@ static int mock_set_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_set_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>  
> -	if (uuid_equal(&input->hdr.uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->hdr.uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_set_test_feature(mdata, cmd);
>  
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;

